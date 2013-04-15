Before do
  FileUtils.rm_rf(TEST_DIR)
  FileUtils.mkdir(TEST_DIR)
  Dir.chdir(TEST_DIR)
end

After do
  Dir.chdir(TEST_DIR)
  FileUtils.rm_rf(TEST_DIR)
end

Given /^I have a blank site in "(.*)"$/ do |path|
  FileUtils.mkdir(path)
end

# Like "I have a foo file" but gives a yaml front matter so jekyll actually processes it
Given /^I have an? "(.*)" page(?: with (.*) "(.*)")? that contains "(.*)"$/ do |file, key, value, text|
  File.open(file, 'w') do |f|
    f.write <<EOF
---
#{key || 'layout'}: #{value || 'nil'}
---
#{text}
EOF
  end
end

Given /^I have an? "(.*)" file that contains "(.*)"$/ do |file, text|
  File.open(file, 'w') do |f|
    f.write(text)
  end
end

Given /^I have a (.*) layout that contains "(.*)"$/ do |layout, text|
  File.open(File.join('_layouts', layout + '.html'), 'w') do |f|
    f.write(text)
  end
end

Given /^I have a (.*) theme that contains "(.*)"$/ do |layout, text|
  File.open(File.join('_theme', layout + '.html'), 'w') do |f|
    f.write(text)
  end
end

Given /^I have an? (.*) directory$/ do |dir|
  FileUtils.mkdir_p(dir)
end

Given /^I have the following (draft|post)s?(?: (.*) "(.*)")?:$/ do |status, direction, folder, table|
  table.hashes.each do |post|
    title = post['title'].downcase.gsub(/[^\w]/, " ").strip.gsub(/\s+/, '-')

    if direction && direction == "in"
      before = folder || '.'
    elsif direction && direction == "under"
      after = folder || '.'
    end

    ext = post['type'] || 'textile'

    if "draft" == status
      path = File.join(before || '.', '_drafts', after || '.', "#{title}.#{ext}")
    else
      format = if has_time_component?(post['date'])
        '%Y-%m-%d %H:%M %z'
      else
        '%m/%d/%Y' # why even
      end
      parsed_date = DateTime.strptime(post['date'], format)
      post['date'] = parsed_date.to_s
      date = parsed_date.strftime('%Y-%m-%d')
      path = File.join(before || '.', '_posts', after || '.', "#{date}-#{title}.#{ext}")
    end

    matter_hash = {}
    %w(title layout tag tags category categories published author path).each do |key|
      matter_hash[key] = post[key] if post[key]
    end
    if "post" == status
      matter_hash["date"] = post["date"] if post["date"]
    end
    matter = matter_hash.map { |k, v| "#{k}: #{v}\n" }.join.chomp

    content = post['content']
    if post['input'] && post['filter']
      content = "{{ #{post['input']} | #{post['filter']} }}"
    end

    File.open(path, 'w') do |f|
      f.write <<EOF
---
#{matter}
---
#{content}
EOF
    end
  end
end

Given /^I have a configuration file with "(.*)" set to "(.*)"$/ do |key, value|
  File.open('_config.yml', 'w') do |f|
    f.write("#{key}: #{value}\n")
  end
end

Given /^I have a configuration file with:$/ do |table|
  File.open('_config.yml', 'w') do |f|
    table.hashes.each do |row|
      f.write("#{row["key"]}: #{row["value"]}\n")
    end
  end
end

Given /^I have a configuration file with "([^\"]*)" set to:$/ do |key, table|
  File.open('_config.yml', 'w') do |f|
    f.write("#{key}:\n")
    table.hashes.each do |row|
      f.write("- #{row["value"]}\n")
    end
  end
end


When /^I run jekyll$/ do
  run_jekyll
end

When /^I run jekyll with drafts$/ do
  run_jekyll(:drafts => true)
end

When /^I debug jekyll$/ do
  run_jekyll(:debug => true)
end

When /^I change "(.*)" to contain "(.*)"$/ do |file, text|
  File.open(file, 'a') do |f|
    f.write(text)
  end
end

Then /^the (.*) directory should exist$/ do |dir|
  assert File.directory?(dir), "The directory \"#{dir}\" does not exist"
end

Then /^I should see "(.*)" in "(.*)"$/ do |text, file|
  assert Regexp.new(text).match(File.open(file).readlines.join)
end

Then /^I should see escaped "(.*)" in "(.*)"$/ do |text, file|
  assert Regexp.new(Regexp.escape(text)).match(File.open(file).readlines.join)
end

Then /^the "(.*)" file should exist$/ do |file|
  assert File.file?(file)
end

Then /^the "(.*)" file should not exist$/ do |file|
  assert !File.exists?(file)
end

Then /^I should see today's time in "(.*)"$/ do |file|
  assert_match Regexp.new(Regexp.escape(Time.now.to_s)), File.open(file).readlines.join
end

Then /^I should see today's date in "(.*)"$/ do |file|
  assert_match Regexp.new(Date.today.to_s), File.open(file).readlines.join
end
