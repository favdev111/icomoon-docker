require 'helper'

class TestDocument < Test::Unit::TestCase

  context "a document in a collection" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["methods"],
        "source"      => source_dir,
        "destination" => dest_dir
      }))
      @site.process
      p @site.collections["methods"]
      @document = @site.collections["methods"].docs.first
    end

    should "exist" do
      assert !@document.nil?
    end

    should "know its relative path" do
      assert_equal "_methods/configuration.md", @document.relative_path
    end

    should "knows its extname" do
      assert_equal ".md", @document.extname
    end

    should "know its basename" do
      assert_equal "configuration.md", @document.basename
    end

    should "know its basename without extname" do
      assert_equal "configuration", @document.basename_without_ext
    end

    should "know whether its a yaml file" do
      assert_equal false, @document.yaml_file?
    end

    should "know its data" do
      assert_equal({
        "title" => "Jekyll.configuration",
        "whatever" => "foo.bar"
      }, @document.data)
    end

    should "output the collection name in the #to_liquid method" do
      assert_equal @document.to_liquid['collection'], "methods"
    end

  end

  context "a document as part of a collection with frontmatter defaults" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["slides"],
        "source"      => source_dir,
        "destination" => dest_dir,
        "defaults" => [{
          "scope"=> {"path"=>"", "type"=>"slides"},
          "values"=> {
            "nested"=> {
              "key"=>"myval",
            }
          }
        }]
      }))
      @site.process
      @document = @site.collections["slides"].docs.select{|d| d.is_a?(Document) }.first
    end

    should "know the frontmatter defaults" do
      assert_equal({
        "title"=>"Example slide",
        "layout"=>"slide",
        "nested"=> {
          "key"=>"myval"
        }
      }, @document.data)
    end
  end

  context "a document as part of a collection with overriden default values" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["slides"],
        "source"      => source_dir,
        "destination" => dest_dir,
        "defaults" => [{
          "scope"=> {"path"=>"", "type"=>"slides"},
          "values"=> {
            "nested"=> {
              "test1"=>"default1",
              "test2"=>"default1"
            }
          }
        }]
      }))
      @site.process
      @document = @site.collections["slides"].docs[1]
    end

    should "override default values in the document frontmatter" do
      assert_equal({
        "title"=>"Override title",
        "layout"=>"slide",
        "nested"=> {
          "test1"=>"override1",
          "test2"=>"override2"
        }
      }, @document.data)
    end
  end

  context "a document as part of a collection with valid path" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["slides"],
        "source"      => source_dir,
        "destination" => dest_dir,
        "defaults" => [{
          "scope"=> {"path"=>"slides", "type"=>"slides"},
          "values"=> {
            "nested"=> {
              "key"=>"value123",
            }
          }
        }]
      }))
      @site.process
      @document = @site.collections["slides"].docs.first
    end

    should "know the frontmatter defaults" do
      assert_equal({
        "title"=>"Example slide",
        "layout"=>"slide",
        "nested"=> {
          "key"=>"value123"
        }
      }, @document.data)
    end
  end

  context "a document as part of a collection with invalid path" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["slides"],
        "source"      => source_dir,
        "destination" => dest_dir,
        "defaults" => [{
          "scope"=> {"path"=>"somepath", "type"=>"slides"},
          "values"=> {
            "nested"=> {
              "key"=>"myval",
            }
          }
        }]
      }))
      @site.process
      @document = @site.collections["slides"].docs.first
    end

    should "not know the specified frontmatter defaults" do
      assert_equal({
        "title"=>"Example slide",
        "layout"=>"slide"
      }, @document.data)
    end
  end

  context "a document in a collection with a custom permalink" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => ["slides"],
        "source"      => source_dir,
        "destination" => dest_dir
      }))
      @site.process
      @document = @site.collections["slides"].docs[2]
      @dest_file = dest_dir("slide/3/index.html")
    end

    should "know its permalink" do
      assert_equal "/slide/3/", @document.permalink
    end

    should "produce the right URL" do
      assert_equal "/slide/3/", @document.url
    end
  end

  context "a document in a collection with custom filename permalinks" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => {
          "slides" => {
            "output"    => true,
            "permalink" => "/slides/test/:name"
          }
        },
        "source"      => source_dir,
        "destination" => dest_dir
      }))
      @site.process
      @document = @site.collections["slides"].docs[0]
    end

    should "produce the right URL" do
      assert_equal "/slides/test/example-slide-1", @document.url
    end
  end

  context "documents in a collection with custom title permalinks" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => {
          "slides" => {
            "output"    => true,
            "permalink" => "/slides/:title"
          }
        },
        "source"      => source_dir,
        "destination" => dest_dir
      }))
      @site.process
      p @site.collections["slides"]
      @document = @site.collections["slides"].docs[3]
      @document_without_title = @site.collections["slides"].docs[4]
    end

    should "produce the right URL if they have a title" do
      assert_equal "/slides/so-what-is-jekyll-exactly", @document.url
    end

    should "produce the right URL if they don't have a title" do
      assert_equal "/slides/example-slide-5", @document_without_title.url
    end
  end

  context "a static file in a collection" do
    setup do
      @site = Site.new(Jekyll.configuration({
        "collections" => {
          "slides" => {
            "output" => true
          }
        },
        "source"      => source_dir,
        "destination" => dest_dir
      }))
      @site.process
      @document = @site.collections["slides"].files.find { |doc| doc.relative_path == "_slides/octojekyll.png" }
      @dest_file = dest_dir("slides/octojekyll.png")
    end

    should "be a static file" do
      assert_equal true, @document.is_a?(StaticFile)
    end

    should "be set to write" do
      assert @document.write?
    end

    should "be in the list of docs_to_write" do
      assert @site.docs_to_write.include?(@document)
    end

    should "be output in the correct place" do
      assert_equal true, File.file?(@dest_file)
    end
  end

end
