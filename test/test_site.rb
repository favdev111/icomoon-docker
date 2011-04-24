require 'helper'

class TestSite < Test::Unit::TestCase
  context "creating sites" do
    setup do
      stub(Jekyll).configuration do
        Jekyll::DEFAULTS.merge({'source' => source_dir, 'destination' => dest_dir})
      end
      @site = Site.new(Jekyll.configuration)
    end

    should "have an empty tag hash by default" do
      assert_equal Hash.new, @site.tags
    end

    should "reset data before processing" do
      clear_dest
      @site.process
      before_posts = @site.posts.length
      before_layouts = @site.layouts.length
      before_categories = @site.categories.length
      before_tags = @site.tags.length
      before_pages = @site.pages.length
      before_static_files = @site.static_files.length
      before_time = @site.time

      @site.process
      assert_equal before_posts, @site.posts.length
      assert_equal before_layouts, @site.layouts.length
      assert_equal before_categories, @site.categories.length
      assert_equal before_tags, @site.tags.length
      assert_equal before_pages, @site.pages.length
      assert_equal before_static_files, @site.static_files.length
      assert before_time <= @site.time
    end

    should "write only modified static files" do
      clear_dest
      StaticFile.reset_cache

      @site.process
      some_static_file = @site.static_files[0].path
      dest = File.expand_path(@site.static_files[0].destination(@site.dest))
      mtime1 = File.stat(dest).mtime.to_i # first run must generate dest file

      # need to sleep because filesystem timestamps have best resolution in seconds
      sleep 1
      @site.process
      mtime2 = File.stat(dest).mtime.to_i
      assert_equal mtime1, mtime2

      # simulate file modification by user
      FileUtils.touch some_static_file

      sleep 1
      @site.process
      mtime3 = File.stat(dest).mtime.to_i
      assert_not_equal mtime2, mtime3 # must be regenerated!

      sleep 1
      @site.process
      mtime4 = File.stat(dest).mtime.to_i
      assert_equal mtime3, mtime4 # no modifications, so must be the same
    end

    should "write static files if not modified but missing in destination" do
      clear_dest
      StaticFile.reset_cache

      @site.process
      some_static_file = @site.static_files[0].path
      dest = File.expand_path(@site.static_files[0].destination(@site.dest))
      mtime1 = File.stat(dest).mtime.to_i # first run must generate dest file

      # need to sleep because filesystem timestamps have best resolution in seconds
      sleep 1
      @site.process
      mtime2 = File.stat(dest).mtime.to_i
      assert_equal mtime1, mtime2

      # simulate destination file deletion
      File.unlink dest

      sleep 1
      @site.process
      mtime3 = File.stat(dest).mtime.to_i
      assert_not_equal mtime2, mtime3 # must be regenerated and differ!

      sleep 1
      @site.process
      mtime4 = File.stat(dest).mtime.to_i
      assert_equal mtime3, mtime4 # no modifications, so must be the same
    end

    should "read layouts" do
      @site.read_layouts
      assert_equal ["default", "simple"].sort, @site.layouts.keys.sort
    end

    should "read posts" do
      @site.read_posts('')
      posts = Dir[source_dir('_posts', '*')]
      assert_equal posts.size - 1, @site.posts.size
    end

    should "deploy payload" do
      clear_dest
      @site.process

      posts = Dir[source_dir("**", "_posts", "*")]
      categories = %w(bar baz category foo z_category publish_test win).sort

      assert_equal posts.size - 1, @site.posts.size
      assert_equal categories, @site.categories.keys.sort
      assert_equal 4, @site.categories['foo'].size
    end

    should "filter entries" do
      ent1 = %w[foo.markdown bar.markdown baz.markdown #baz.markdown#
              .baz.markdow foo.markdown~]
      ent2 = %w[.htaccess _posts _pages bla.bla]

      assert_equal %w[foo.markdown bar.markdown baz.markdown], @site.filter_entries(ent1)
      assert_equal %w[.htaccess bla.bla], @site.filter_entries(ent2)
    end

    should "filter entries with exclude" do
      excludes = %w[README TODO]
      includes = %w[index.html site.css]

      @site.exclude = excludes
      assert_equal includes, @site.filter_entries(excludes + includes)
    end
    
    context 'with orphaned files in destination' do
      setup do
        clear_dest
        @site.process
        # generate some orphaned files:
        # hidden file
        File.open(dest_dir('.htpasswd'), 'w')
        # single file
        File.open(dest_dir('obsolete.html'), 'w')
        # single file in sub directory
        FileUtils.mkdir(dest_dir('qux'))
        File.open(dest_dir('qux/obsolete.html'), 'w')
        # empty directory
        FileUtils.mkdir(dest_dir('quux'))
      end
      
      teardown do
        FileUtils.rm_f(dest_dir('.htpasswd'))
        FileUtils.rm_f(dest_dir('obsolete.html'))
        FileUtils.rm_rf(dest_dir('qux'))
        FileUtils.rm_f(dest_dir('quux'))
      end
      
      should 'remove orphaned files in destination' do
        @site.process
        assert !File.exist?(dest_dir('.htpasswd'))
        assert !File.exist?(dest_dir('obsolete.html'))
        assert !File.exist?(dest_dir('qux'))
        assert !File.exist?(dest_dir('quux'))
      end

    end
    
    context 'with an invalid markdown processor in the configuration' do
      should 'not throw an error at initialization time' do
        bad_processor = 'not a processor name'
        assert_nothing_raised do
          Site.new(Jekyll.configuration.merge({ 'markdown' => bad_processor }))
        end
      end
      
      should 'throw FatalException at process time' do
        bad_processor = 'not a processor name'
        s = Site.new(Jekyll.configuration.merge({ 'markdown' => bad_processor }))
        assert_raise Jekyll::FatalException do
          s.process
        end
      end
    end
    
  end
end
