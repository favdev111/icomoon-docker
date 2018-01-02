## 3.7.0 / 2018-01-02

### Minor Enhancements

  * Add LiveReload functionality to Jekyll. (#5142)
  * Add Utils::Internet.connected? to determine whether host machine has internet connection. (#5870)
  * Disable default layouts for Pages with a `layout: none` declaration (#6182)
  * Scope path glob (#6268)
  * Allow the user to set collections_dir to put all collections under one subdirectory (#6331)
  * Upgrade to Rouge 3 (#6381)
  * Allow URL filters to work directly with documents (#6478)
  * filter relative_url should keep absolute urls with scheme/authority (#6490)
  * `.sass-cache` doesn&#39;t *always* land in `options[&#39;source&#39;]` (#6500)
  * Allow plugins to modify the obsolete files. (#6502)
  * Add latin mode to `slugify` (#6509)
  * Log Kramdown warnings if log level is WARN (#6522)
  * Add an option to configure kramdown warning output (#6554)
  * Add `json` extension to list of directory indices (#6550)
  * Dependency: Bump jekyll-watch to 2.0 (#6589)
  * Remove paginate check (#6606)
  * update classifier-reborn to 2.2.0 (#6631)
  * Switch to an actively-maintained TOML parser. (#6652)
  * Do not coerce layout paths in theme-gem to the source directory (#6603)

### Bug Fixes

  * Raise when theme root directory is not available (#6455)
  * Avoid block parser warning in SmartyPants (#6565)
  * Fail gracefully if &#34;sass&#34; gem cannot be loaded (#6573)
  * return correct file in dir if dir has same name as file (#6569)
  * Register reload hooks in Server#process (#6605)
  * Memoize path to metadata file (#6602)
  * Use `require_relative` to load Jekyll classes (#6609)

### Development Fixes

  * Added direct collection access to future collection item feature test(#6151)
  * add failing test for non-utf8 encoding (#6339)
  * Upgrade to Cucumber 3.0 (#6395)
  * Provide a better default hash for tracking liquid stats (#6417)
  * Add configuration for first-timers bot (#6431)
  * Do not linkify escaped characters as PRs in History (#6468)
  * Rely on jekyll-mentions for linking usernames (#6469)
  * Update first-timers-issue-template.md (#6472)
  * Enable `Lint/RescueWithoutErrorClass` Cop (#6482)
  * Clean up Rubocop config (#6495)
  * Use Gem to discover the location of bundler (#6499)
  * Remove unnecessary encoding comment (#6513)
  * Suggest using Rubocop to automatically fix errors (#6514)
  * Assert raising Psych::SyntaxError when`&#34;strict_front_matter&#34;=&gt;true` (#6520)
  * Use Kernel#Array instead of explicit Array check (#6525)
  * RuboCop: Enable `Style/UnneededCapitalW` cop (#6526)
  * Refactor method to reduce ABC Metric size (#6529)
  * Remove parentheses around arguments to raise (#6532)
  * Use double-quotes around gem name (#6535)
  * Dependencies: upgrade to toml 0.2.0 (#6541)
  * Lock to cucumber 3.0.1 on Ruby 2.1 (#6546)
  * Bump JRuby version in Travis config (#6561)
  * Rescue from Psych::SyntaxError instead of SyntaxError after parsing YAML(#5828)
  * Drop forwarding to private methods by exposing those methods as public(#6577)
  * Upgrade pygments to v1.x (#5937)
  * Bump yajl-ruby (#6582)
  * Cleanup test_redcarpet.rb (#6584)
  * Add PageWithoutAFile class from jekyll plugins (#6556)
  * Cleanup LiveReloadReactor (#6607)

### Documentation

  * Add formester to the list of saas form backend (#6059)
  * GitHub Pages instructions (#6384)
  * Improve documentation for theme-gem installation (#6387)
  * Fix diff syntax-highlighting (#6388)
  * Update instructions (#6396)
  * Fix code-block highlighting in docs (#6398)
  * Filtering Posts with categories, tags, or other variables (#6399)
  * Fixes formatting on pre-formatted text. (#6405)
  * Added new tutorial to tutorials section on docs (#6406)
  * Updates (#6407)
  * Fix `collections_dir` example (#6408)
  * Renaming duplicate of &#34;Scenario 6&#34; to &#34;Scenario 7&#34; (#6411)
  * Mark `collection_dir` as unreleased (#6412)
  * Fix link to SUPPORT (#6415)
  * Fix list appearance by adding missing `ol` tag (#6421)
  * Explain how to override output collection index page (#6424)
  * Added github-cards to the list of plugins (#6425)
  * CoC violation correspondants (#6429)
  * Add a note about Liquid and syntax highlighting (#6466)
  * Remove `sudo` from macOS troubleshooting instructions (#6486)
  * Add a note on `:jekyll_plugins` group in the docs (#6488)
  * Updated custom-404-page.md (#6489)
  * Fix a few minor issues in the docs (#6494)
  * Add jekyll-pwa-plugin (#6533)
  * Remove Jekyll-Smartify from plugins directory (#6548)
  * Updated Jekyll-Pug listing to include official website (#6555)
  * Remove link to severly outdated asset plugin (#6613)
  * Default time zone depends upon server (#6617)
  * Add `disqus-for-jekyll` to plugins. (#6618)
  * Update &#34;Requirements&#34; for Ruby version (#6623)
  * Fix: Update link to i18n_filter plugin (#6638)
  * Correct WordPress capitalization (#6645)
  * Add Tweetsert, Stickyposts, Paginate::Content (#6651)
  * Post: Jekyll 3.7.0 released (#6634)

### Site Enhancements

  * Add special styling for code-blocks run in shell (#6389)
  * Add post about diversity (#6447)
  * Update list of files excluded from Docs site (#6457)
  * Update site History (#6460)
  * Add default twitter card image (#6476)
  * Update normalize.css to v7.0.0 (#6491)
  * Optimize images (#6519)
  * Back to original main navigation (#6544)
  * Styles: mobile-docs select element (#6545)
  * Search with DocSearch by @Algolia (#6557)
  * Site header redesign (#6567)
  * Move logo above site navigation on small screens (#6570)
  * Docs: Include version badge for latest features (#6574)
  * Use version-badge on an existing feature intro (#6575)
  * Add jekyll-category-pages plugin (#6632)
  * Improve docs styling for code to be run in shell (#6641)
  * Fix permalink icon markup in news-item layout (#6639)

## 3.6.2 / 2017-10-21

### Development Fixes

  * Update Rubocop to 0.51.0 (#6444)
  * Add test for layout as string (#6445)

### Bug Fixes

  * Problematic UTF+bom files (#6322)
  * Always treat `data.layout` as a string (#6442)

## 3.6.1 / 2017-10-20

### Documentation

  * Doc y_day in docs/permalinks (#6244)
  * Update frontmatter.md (#6371)
  * Elaborate on excluding items from processing (#6136)
  * Style lists in tables (#6379)
  * Remove duplicate &#34;available&#34; (#6380)

### Development Fixes

  * Bump rubocop to use `v0.50.x` (#6368)

## 3.6.0 / 2017-09-21

### Minor Enhancements

  * Ignore final newline in folded YAML string (#6054)
  * Add URL checks to Doctor (#5760)
  * Fix serving files that clash with directories (#6222) (#6231)
  * Bump supported Ruby version to `>= 2.1.0` (#6220)
  * set `LiquidError#template_name` for errors in included file (#6206)
  * Access custom config array throughout session (#6200)
  * Add support for Rouge 2, in addition to Rouge 1 (#5919)
  * Allow `yield` to logger methods &amp; bail early on no-op messages (#6315)
  * Update mime-types. (#6336)
  * Use a Schwartzian transform with custom sorting (#6342)
  * Alias `Drop#invoke_drop` to `Drop#[]` (#6338)

### Bug Fixes

  * `Deprecator`: fix typo for `--serve` command (#6229)
  * `Reader#read_directories`: guard against an entry not being a directory (#6226)
  * kramdown: symbolize keys in-place (#6247)
  * Call `to_s` on site.url before attempting to concatenate strings (#6253)
  * Enforce Style/FrozenStringLiteralComment (#6265)
  * Update theme-template README to note &#39;assets&#39; directory (#6257)
  * Memoize the return value of `Document#url` (#6266)
  * delegate `StaticFile#to_json` to `StaticFile#to_liquid` (#6273)
  * Fix `Drop#key?` so it can handle a nil argument (#6281)
  * Guard against type error in absolute url (#6280)
  * Mutable drops should fallback to their own methods when a mutation isn&#39;t present (#6350)
  * Skip adding binary files as posts (#6344)
  * Don&#39;t break if bundler is not installed (#6377)

### Documentation

  * Fix a typo in `custom-404-page.md` (#6218)
  * Docs: fix links to issues in History.markdown (#6255)
  * Update deprecated gems key to plugins. (#6262)
  * Fixes minor typo in post text (#6283)
  * Execute build command using bundle. (#6274)
  * name unification - buddy details (#6317)
  * name unification - application index (#6318)
  * trim and relocate plugin info across docs (#6311)
  * update Jekyll&#39;s README (#6321)
  * add SUPPORT file for GitHub (#6324)
  * Rename CODE_OF_CONDUCT to show in banner (#6325)
  * Docs : illustrate page.id for a collection&#39;s document (#6329)
  * Docs: post&#39;s date can be overriden in YAML front matter (#6334)
  * Docs: `site.url` behavior on development and production environments (#6270)
  * Fix typo in site.url section of variables.md :-[ (#6337)
  * Docs: updates (#6343)
  * Fix precedence docs (#6346)
  * add note to contributing docs about `script/console` (#6349)
  * Docs: Fix permalink example (#6375)

### Site Enhancements

  * Adding DevKit helpers (#6225)
  * Customizing url in collection elements clarified (#6264)
  * Plugins is the new gems (#6326)

### Development Fixes

  * Strip unnecessary leading whitespace in template (#6228)
  * Users should be installing patch versions. (#6198)
  * Fix tests (#6240)
  * Define path with `__dir__` (#6087)
  * exit site.process sooner (#6239)
  * make flakey test more robust (#6277)
  * Add a quick test for DataReader (#6284)
  * script/backport-pr: commit message no longer includes the `#` (#6289)
  * Add Add CODEOWNERS file to help automate reviews. (#6320)
  * Fix builds on codeclimate (#6333)
  * Bump rubies on Travis (#6366)

## 3.5.2 / 2017-08-12

### Bug Fixes

  * Backport #6281 for v3.5.x: Fix `Drop#key?` so it can handle a nil argument (#6288)
  * Backport #6280 for v3.5.x: Guard against type error in `absolute_url` (#6287)
  * Backport #6266 for v3.5.x: Memoize the return value of `Document#url` (#6301)
  * Backport #6273 for v3.5.x: delegate `StaticFile#to_json` to `StaticFile#to_liquid` (#6302)
  * Backport #6226 for v3.5.x: `Reader#read_directories`: guard against an entry not being a directory (#6304)
  * Backport #6247 for v3.5.x: kramdown: symbolize keys in-place (#6303)

## 3.5.1 / 2017-07-17

### Minor Enhancements

  * Use Warn for deprecation messages (#6192)
  * site template: Use plugins key instead of gems  (#6045)

### Bug Fixes

  * Backward compatiblize URLFilters module (#6163)
  * Static files contain front matter default keys when `to_liquid`'d  (#6162)
  * Always normalize the result of the `relative_url` filter (#6185)

### Documentation

  * Update reference to trouble with OS X/macOS (#6139)
  * added BibSonomy plugin (#6143)
  * add plugins for multiple page pagination (#6055)
  * Update minimum Ruby version in installation.md (#6164)
  * Add information about finding a collection in `site.collections` (#6165)
  * Add `{% raw %}` to Liquid example on site (#6179)
  * Added improved Pug plugin - removed 404 Jade plugin (#6174)
  * Linking the link (#6210)
  * Small correction in documentation for includes (#6193)
  * Fix docs site page margin (#6214)

### Development Fixes

  * Add jekyll doctor to GitHub Issue Template (#6169)
  * Test with Ruby 2.4.1-1 on AppVeyor (#6176)
  * set minimum requirement for jekyll-feed (#6184)

## 3.5.0 / 2017-06-18

### Minor Enhancements

  * Upgrade to Liquid v4 (#4362)
  * Convert StaticFile liquid representation to a Drop & add front matter defaults support to StaticFiles (#5871)
  * Add support for Tab-Separated Values data files (`*.tsv`) (#5985)
  * Specify version constraint in subcommand error message. (#5974)
  * Add a template for custom 404 page (#5945)
  * Require `runtime_dependencies` of a Gem-based theme from its `.gemspec` file (#5914)
  * Don't raise an error if URL contains a colon (#5889)
  * Date filters should never raise an exception (#5722)
  * add `plugins` config key as replacement for `gems` (#5130)
  * create configuration from options only once in the boot process (#5487)
  * Add option to fail a build with front matter syntax errors (#5832)
  * Disable default layouts for documents with a `layout: none` declaration (#5933)
  * In `jekyll new`, make copied site template user-writable (#6072)
  * Add top-level `layout` liquid variable to Documents (#6073)
  * Address reading non-binary static files in themes (#5918)
  * Allow filters to sort & select based on subvalues (#5622)
  * Add strip_index filter (#6075)

### Documentation

  * Install troubleshooting on Ubuntu (#5817)
  * Add Termux section on troubleshooting (#5837)
  * fix ial css classes in theme doc (#5876)
  * Update installation.md (#5880)
  * Update Aerobatic docs (#5883)
  * Add note to collections doc on hard-coded collections. (#5882)
  * Makes uri_escape template docs more specific. (#5887)
  * Remove duplicate footnote_nr from default config (#5891)
  * Fixed tutorial for publishing gem to include repo. (#5900)
  * update broken links (#5905)
  * Fix typo in contribution information (#5910)
  * update plugin repo URL to reflect repo move (#5916)
  * Update exclude array in configuration.md (#5947)
  * Fixed path in "Improve this page" link in Tutorials section (#5951)
  * Corrected permalink (#5949)
  * Included more details about adding defaults to static files (#5971)
  * Create buddyworks (#5962)
  * added (buddyworks) to ci list (#5965)
  * Add a tutorial on serving custom Error 404 page (#5946)
  * add custom 404 to tutorial navigation (#5978)
  * Add link to order of interpretation tutorial in Tutorials nav (#5952)
  * Document Jekyll's Philosophy (#5792)
  * Require Ruby > 2.1.0 (#5983)
  * Fix broken link (#5994)
  * Default options for script/proof (#5995)
  * Mention Bash on Ubuntu on Windows (#5960)
  * Document `--unpublished` flag introduced in 91e9ecf (#5959)
  * Update upgrading.md to mention usage of `bundle update` (#5604)
  * Fix missing quotation mark (#6002)
  * New tutorial: Convert an HTML site to Jekyll (#5881)
  * Revamp Permalink section (#5912)
  * Fixup tutorial on creating theme from existing HTML templates (#6006)
  * Standardise on "URLs" without apostrophe in docs (#6018)
  * Added txtpen in tutorial (#6021)
  * fix typo using past participle (#6026)
  * changed formatting to fit the style of the documentation (#6027)
  * doc fix typo word usage (#6028)
  * corrected reference to layout in index.md (#6032)
  * (Minor) Update MathJax CDN (#6013)
  * Add MvvmCross to samples (#6035)
  * Update travis-ci.md to correct procedure (#6043)
  * fix sentence in documentation (#6048)
  * rephrase a sentence in posts.md to be more direct (#6049)
  * Compress Website Sass output (#6009)
  * doc correct spelling error (#6050)
  * adjusted date-format in sitemap (#6053)
  * Typo fix (welcomed change -> welcome change). (#6070)
  * Fixed documentation inconsistency (#6068)
  * Add own plugin -> Jekyll Brand Social Wall (#6064)
  * Added plugin jekyll-analytics (#6042)
  * Use more precise language when explaining links (#6078)
  * Update plugins.md (#6088)
  * windows 10 tutorial (#6100)
  * Explain how to override theme styles (#6107)
  * updated Bash on Ubuntu on Windows link in tutorial (#6111)
  * Fix wording in `_docs/templates.md` links section (#6114)
  * Update windows.md (#6115)
  * Added windows to docs.yml (#6109)
  * Be more specific on what to upload (#6119)
  * Remove Blank Newlines from "Jekyll on Windows" Page (#6126)
  * Link the troubleshooting page in the quickstart page (#6134)
  * add documentation about the &#34;pinned&#34; label (#6147)
  * docs(JekyllOnWindows): Add a new Installation way (#6141)
  * corrected windows.md (#6149)
  * Refine documentation for Windows (#6153)

### Development Fixes

  * Rubocop: add missing comma (#5835)
  * Appease classifier-reborn (#5934)
  * Allow releases & development on `*-stable` branches (#5926)
  * Add script/backport-pr (#5925)
  * Prefer .yaml over .toml (#5966)
  * Fix Appveyor with DST-aware cucumber steps (#5961)
  * Use Rubocop v0.47.1 till we're ready for v0.48 (#5989)
  * Test against Ruby 2.4.0 (#5687)
  * rubocop: lib/jekyll/renderer.rb complexity fixes (#5052)
  * Use yajl-ruby 1.2.2 (now with 2.4 support) (#6007)
  * Bump Rubocop to v0.48 (#5997)
  * doc use example.com (#6031)
  * fix typo (#6040)
  * Fix CI  (#6044)
  * Remove `ruby RUBY_VERSION` from generated Gemfile (#5803)
  * Test if hidden collections output a document with a future date (#6103)
  * Add test for uri_escape on reserved characters (#6086)
  * Allow you to specify the rouge version via an environment variable for testing (#6138)
  * Bump Rubocop to 0.49.1 (#6093)
  * Lock nokogiri to 1.7.x for Ruby 2.1 (#6140)

### Site Enhancements

  * Corrected date for version 3.4.0 (#5842)
  * Add the correct year to the 3.4.0 release date (#5858)
  * Add documentation about order of interpretation (#5834)
  * Documentation on how to build navigation (#5698)
  * Navigation has been moved out from docs (#5927)
  * Make links in sidebar for current page more prominent (#5820)
  * Update normalize.css to v6.0.0 (#6008)
  * Docs: rename `gems` to `plugins` (#6082)
  * plugins -> gems (#6110)
  * Document difference between cgi_escape and uri_escape #5970 (#6081)

### Bug Fixes

  * Exclude Gemfile by default (#5860)
  * Convertible#validate_permalink!: ensure the return value of `data["permalink"]` is a string before asking if it is empty (#5878)
  * Allow abbreviated post dates (#5920)
  * Remove dependency on include from default about.md (#5903)
  * Allow colons in `uri_escape` filter (#5957)
  * Re-surface missing public methods in `Jekyll::Document` (#5975)
  * absolute_url should not mangle URL if called more than once (#5789)
  * patch URLFilters to prevent `//` (#6058)
  * add test to ensure variables work in `where_exp` condition (#5315)
  * Read explicitly included dot-files in collections. (#6092)
  * Default `baseurl` to `nil` instead of empty string (#6137)
  * Filters#time helper: Duplicate time before calling #localtime. (#5996)

## 3.4.5 / 2017-06-30

  * Backport #6185 for v3.4.x: Always normalize the result of the `relative_url` filter (#6186)

## 3.4.4 / 2017-06-17

  * Backport #6137 for v3.4.x: Default `baseurl` to `nil` instead of empty string (#6146)

## 3.4.3 / 2017-03-21

  * Backport #5957 for v3.4.x: Allow colons in `uri_escape` filter (#5968)

## 3.4.2 / 2017-03-09

  * Backport #5871 for v3.4.x: Convert StaticFile liquid representation to a Drop & add front matter defaults support to StaticFiles (#5940)

## 3.4.1 / 2017-03-02

  * Backport #5920 for v3.4.x: Allow abbreviated post dates (#5924)

## 3.4.0 / 2017-01-27

### Minor Enhancements

  * Add connector param to `array_to_sentence_string` filter (#5597)
  * Adds `group_by_exp` filter (#5513)
  * Use Addressable instead of URI to decode (#5726)
  * throw IncludeTagError if error occurs in included file (#5767)
  * Write Jekyll::Utils::Exec.run for running shell commands. (#5640)
  * Use the current year for the LICENSE of theme (#5712)
  * Update License (#5713)

### Bug Fixes

  * Escaped regular expressions when using `post_url`. (#5605)
  * fix date parsing in file names to be stricter (#5609)
  * Add a module to re-define `ENV["TZ"]` in Windows (#5612)
  * Use each instead of map to actually return nothing (#5668)
  * include: fix 'no implicit conversion of nil to String' (#5750)
  * Don't include the theme's includes_path if it is nil. (#5780)
  * test double slash when input = '/' (#5542)
  * use logger.info for related posts (#5822)

### Site Enhancements

  * Use only the used Font Awesome icons. (#5530)
  * Switch to `https` when possible. (#5611)
  * Update `_font-awesome.scss` to move .woff file before .ttf (#5614)
  * Update documentation on updating FontAwesome Iconset (#5655)
  * Use defaults for docs and news-items (#5744)
  * Sort gems in `docs/_config.yml` (#5746)
  * Add missing class (#5791)
  * Improve template docs (#5694)

### Development Fixes

  * clean unit-test names in `test/test_tags.rb` (#5608)
  * Add cucumber feature to test for bonafide theme gems (#5384)
  * Use `assert_nil` instead of `assert_equal nil` (#5652)
  * Rubocop -a on lib/jekyll (#5666)
  * Bump to rake 12.0 (#5670)
  * Rubocop Gemfile (#5671)
  * update Classifier-Reborn to 2.1.0 (#5711)
  * Rubocop: fix Rakefile and gemspec (#5745)
  * Use `assert_nil` (#5725)
  * Sort gems in `jekyll.gemspec` (#5746)
  * Rubocop: Require consistent comma in multiline literals (#5761)
  * Bump rubocop (#5765)
  * New rubocop security checks (#5768)
  * test/helper: fix flaky plugin path test by removing calls to Dir.chdir without a block (#5779)
  * Use latest jemoji gem (#5782)
  * Bump htmlproofer (#5781)
  * Bump rubies we test against (#5784)
  * Bump rdoc to v5.0 (#5797)
  * Bump codeclimate-test-reporter to v1.0.5 (#5798)

### Documentation

  * Improve quickstart docs (#5689)
  * Add Jekyll-Post to list of plugins (#5705)
  * Add jekyll-numbered-headings (#5688)
  * Docs: move permalinks from documents into config (#5544)
  * Improve collections docs (#5691)
  * Fix #5730: add gcc and make to the list of requirements (#5731)
  * Remove instructions to install Jekyll 2 on Windows (#5582)
  * Fix example URL inconsistency (#5592)
  * Replace backticks within HTML blocks with HTML tags (#5435)
  * Add jekyll-migrate-permalink (#5600)
  * Fix bad config YAML in collections example (#5587)
  * Bring documentation on 'Directory Structure' up-to-date (#5573)
  * Fixed typo (#5632)
  * use backticks for Gemfile for consistency since in the next sentence … (#5641)
  * Update Core team list in the README file (#5643)
  * Improve Permalinks documentation. (#5653)
  * Fix typo in Variables doc page (#5657)
  * Fix a couple of typos in the docs (#5658)
  * Update windows.md (#5683)
  * Improve permalinks docs (#5693)
  * Document --unpublished build option (#5720)
  * Improve pages docs (#5692)
  * Added new includes.md topic to docs (#5696)
  * Replace a dead link with a web-archived one (#5738)
  * Remove duplicate paragraph. (#5740)
  * Addition of a sample "typical post" (#5473)
  * Fix a minor grammatical mistake on themes' document ### -dev (#5748)
  * Correct comments in data_reader.rb (#5621)
  * Add jekyll-pre-commit to plugins list (#5752)
  * Update quickstart.md (#5758)
  * Correct minor typo (#5764)
  * Fix a markdown link to look properly on the web (#5769)
  * Info about the help command usage (#5312)
  * Add missing merge labels for jekyllbot (#5753)
  * Fix broken links in documentation (#5736)
  * Docs: add `match_regex` and `replace_regex` filters (#5799)
  * Got that diaper money? (#5810)
  * Sort content by popularity using Google Analytics (#5812)
  * Rework CI doc to include multiple providers. (#5815)
  * Improve theme docs (#5690)
  * Add mention of classifier-reborn for LSI (#5811)
  * Added note about --blank flag (#5802)
  * Fixed inaccuracy in "Built-in permalink styles" docs (#5819)

## 3.3.1 / 2016-11-14

### Minor Enhancements

  * Collapse `gsub` for performance (#5494)
  * URL: warn if key doesn't exist in url drop (#5524)

### Bug Fixes

  * Fix typo in `theme_template` README (#5472)
  * Do not swallow all exceptions on render (#5495)
  * Site template: fixed `_config.yml` comment typo (#5511)
  * `jekyll new-theme` should specify Jekyll as a runtime dependency for the theme (#5457)
  * Be much more specific about ignoring specific vendored directories. (#5564)
  * Only warn about auto-regeneration bug on Bash On Windows. (#5464)
  * Allow permalink template to have underscores (#5572)

### Site Enhancements

  * Documentation: `link` Liquid tag  (#5449)
  * Updating install instruction link for Jekyll 3 on Windows (#5475)
  * Update normalize.css to v5.0.0 (#5471)
  * Add jekyll-data to the list of plugins (#5491)
  * Add info about checking version + updating (#5497)
  * Add jekyll-include-absolute-plugin to list of third-party plugins (#5492)
  * Remove jekyll-hook from deployment methods (#5502)
  * Update deployment-methods.md (#5504)
  * Ubuntu users should install ruby2.3-dev (#5512)
  * Remove Glynn as deployment option (#5519)
  * Fix broken forum link (#5466)
  * Move documentation to docs folder (#5459)
  * Fix broken links in CONTRIBUTING (#5533)
  * Update documentation on jekyllrb.com (#5540)
  * Fix HTML rendering (#5536)
  * Remove outdated deployment information (#5557)
  * no more invalid US-ASCII on lines 30 and 97 (#5520)
  * Add permalinks to docs in '/maintaining/' (#5532)
  * Add jekyll-pinboard to list of third-party plugins (#5514)
  * Fix formatting in 2-to-3.md (#5507)
  * Add two plugins to the plugins page (#5493)
  * Use site.baseurl before link and post_url tags (#5559)
  * Fix link to jekyll-pinboard plugin (#5570)
  * mention `docs` folder as a way to deploy on GitHub Pages (#5571)

### Development Fixes

  * fix rubocop errors on testing with Rubocop 0.44 (#5489)
  * script/test: add missing whitespace (#5479)
  * Restrict Rubocop version (#5496)
  * include a hashbang for all benchmark scripts & make them executable (#5505)
  * Update source in script/proof (#5538)
  * Collections.feature: conditional steps to have it pass on Windows (#5546)
  * Fix tests to get script/test to pass on Windows (#5526)

## 3.3.0 / 2016-10-06

### Minor Enhancements

  * Colorize interpolated output in logger.info (#5239)
  * Site template: exclude Gemfile and Gemfile.lock in site config (#5293)
  * Fix #5233: Increase our ability to detect Windows. (#5235)
  * update gitignore template to ignore theme gems built by user (#5326)
  * Adds ability to link to all files (#5199)
  * Exclude vendor by default (#5361)
  * Add ThemeAssetsReader which reads assets from a theme (#5364)
  * Add bundle install to jekyll new command (#5237)
  * Add absolute_url and relative_url filters. (#5399)
  * Site template: remove `css/` from new site scaffolding (#5402)
  * Site template: Move contents of the index.html page to the 'home' layout (#5420)
  * Exclude node_modules by default (#5210)
  * Run hooks in priority order. (#5157)
  * Add `static_file.name` and `.basename` Liquid attributes (#5264)
  * set site.url in dev environment to `http://localhost:4000` (#5431)
  * Add support for indented link references on excerpt (#5212)

### Bug Fixes

  * Use jekyll-feed to generate the default site's RSS feed (#5196)
  * Site#configure_theme: do not set theme unless it's a string (#5189)
  * Convertible: set self.output in #render_all_layouts and #do_layout (#5337)
  * Only complain about `kramdown.coderay` if it is actually in the config (#5380)
  * Clarify documentation in theme gem's README template (#5376)
  * Allow underscore in highlighter language (#5375)
  * Site template: set empty url in config file by default (#5338)
  * Site template config: prepend 'jekyll serve' with 'bundle exec' (#5430)
  * Don't call `File.utime` for StaticFiles if it's a symlink (#5427)
  * Fix handling of non-ASCII characters in new `*_url` filters (#5410)
  * Remove autoload of Draft which no longer exists. (#5441)
  * Fix issue where Windows drive name is stripped from Jekyll.sanitized_path incorrectly (#5256)
  * Fix bug where `post_url` tag matched incorrect post with subdirectory (#4873)
  * Fix loading data from subdir with a period in name (#5433)
  * Revert Commands::Serve#server_address signature change. (#5456)

### Site Enhancements

  * Document `to_integer` and `inspect` filters (#5185)
  * Fix path in the prompt (#5194)
  * need subcommand build (#5190)
  * Add the Jekyll Cloudinary plugin (#5183)
  * Documentation : `new-theme` command (#5205)
  * Document `link` Liquid tag (#5182)
  * Remove mention of page for link tag in release post (#5214)
  * fixed typo (#5226)
  * Add missing comma (#5222)
  * Maintain aspect ratio with `height: auto;` (#5254)
  * Fix a link in deployment-methods.md (#5244)
  * Documentation: improve highlight in `Creating a theme` (#5249)
  * Bundler isn't installed by default (#5258)
  * Update troubleshooting documentation to include fix for issue with vendored gems (#5271)
  * Link `--lsi` option's description to Wikipedia docs on LSI (#5274)
  * Document `--profile` option on the configuration page (#5279)
  * Update homepage to sync with merge of #5258 (#5287)
  * Add post about Jekyll Admin initial release (#5291)
  * Replace liquid highlight tag with backticks (#5262)
  * Word update (#5294)
  * Site documentation section links always point to https://jekyllrb.com (#5281)
  * Missing `:site, :post_render` payload documentation on site (#5280)
  * Site: exclude README.md and .gitignore (#5304)
  * Add link to Staticman (#5224)
  * Update url for OpenShift (#5320)
  * Add help for missing static_file e.g. on heroku (#5334)
  * Add a line about updating theme-gems in the docs (#5318)
  * Explain how to copy a theme's files (#5335)
  * .md as default extension in examples (#5316)
  * Fix small typo in docs (#5347)
  * Add missing period to sentence in first paragraph. (#5372)
  * added jekyll-spotify plugin (#5369)
  * Add jekyll-menus to the list of plugins. (#5397)
  * macOS and one grammar fix (#5403)
  * Add documentation for `relative_url` and `absolute_url` (#5405)
  * Bugfix on logo in JSON-LD (#5421)
  * Fix Travis.ci documentation (#5413)
  * Update documentation regarding `bundle install` after `jekyll new` (#5428)
  * Replace classic box-sizing reset with inheritance reset (#5411)
  * Update Wikipedia YAML list link (#5452)
  * Add Jekyll 3.3 release post (#5442)

### Development Fixes

  * Update appveyor.yml and fix optional deps for Ruby x64 (#5180)
  * Improve tests for Jekyll::PluginManager (#5167)
  * Update Ruby versions in travis.yml (#5221)
  * Avoid installing unecessary gems for site testing (#5272)
  * Proposal: Affinity teams and their captains (#5273)
  * Replace duplicate with postive local test in issue template (#5286)
  * Update AppVeyor config. (#5240)
  * Execute jekyll from clone instead of defined binary when running 'script/default-site' (#5295)
  * rubocop: lib/jekyll/document.rb complexity fixes (#5045)
  * Proxy a number of Convertible methods to Renderer (#5308)
  * Run executable for Cucumber via Ruby instead of Shell (#5383)
  * Appease Rubocop (#5381)
  * remove features' directories on windows with proper access (#5389)
  * `site_configuration.feature`: use UTC format in timezone (#5416)
  * swallow bundle output from `jekyll new` while in CI (#5408)
  * Add .editorconfig (#5412)

## 3.2.1 / 2016-08-02

### Bug Fixes

  * Include theme directories in default gemspec (#5152)
  * Fix for symlinked themes (#5156)
  * Layout: set `relative_path` without using Pathname (#5164)

### Development Fixes

  * Add test to build the default site (#5154)
  * script/default-site: specify `BUNDLE_GEMFILE` for new site (#5178)
  * script/default-site: read Jekyll source from local clone (#5188)

### Site Enhancements

  * Enable site excerpts (#5150)
  * Initial 404 page (#5143)
  * Remove the "this feature is unreleased" warning from the theme docs (#5158)
  * Future True on GitHub Pages note (#5173)
  * Minor updates and corrections (#5177)
  * index.html: update instructions to require bundler  (#5169)
  * docs/quickstart: update instructions to require bundler (#5168)

## 3.2.0 / 2016-07-26

### Minor Enhancements

  * Stop testing with Ruby 2.0.x, which is EOL'd. (#4381)
  * Allow collections to have documents that have no file extension (#4545)
  * Add size property to `group_by` result (#4557)
  * Site Template: Removed unnecessary nesting from `_base.scss` (#4637)
  * Adding a debug log statment for skipped future documents. (#4558)
  * Site Template: Changed main `<div>` to `<main>` and added accessibility info (#4636)
  * Add array support to `where` filter (#4555)
  * 'jekyll clean': also remove .sass-cache (#4652)
  * Clean up `Tags::PostUrl` a bit, including better errors and date parsing (#4670)
  * Use `String#encode` for `xml_escape` filter instead of `CGI.escapeHTML` (#4694)
  * Add `show_dir_listing` option for serve command and fix index file names (#4533)
  * Site Template: write a Gemfile which is educational to the new site (#4542)
  * Site template: add explanation of site variables in the example `_config.yml` (#4704)
  * Adds `link` Liquid tag to make generation of URLs easier (#4624)
  * Allow static files to be symlinked in unsafe mode or non-prod environments (#4640)
  * Add `:after_init` hook & add `Site#config=` to make resetting config easy (#4703)
  * DocumentDrop: add `#<=>` which sorts by date (falling back to path) (#4741)
  * Add a `where_exp` filter for filtering by expression (#4478)
  * Globalize Jekyll's Filters. (#4792)
  * Gem-based themes (#4595)
  * Allow symlinks if they point to stuff inside `site.source` (#4710)
  * Update colorator dependency to v1.x (#4855)
  * Move EntryFilter to use Pathutil & fix `glob_include?` (#4859)
  * Add 'jekyll new-theme' command to help users get up and running creating a theme (#4848)
  * `markdownify` and `smartify` should convert input to string before conversion (#4958)
  * Run `Site#generate` for 'jekyll doctor' to catch plugin issues (#5005)
  * Add `normalize_whitepace` filter (#4917)
  * Move bin/jekyll to exe/jekyll to prevent collision with binstubs (#5014)
  * Cleaning up site template & theme updates. (#4922)
  * Add fetch method to Drops (#5056)
  * Extract tag name to class method (#5063)
  * check if relative URL contains a colon (#5069)
  * Enable strict (or lax) liquid parsing via a config variable. (#5053)
  * Add filter: `to_integer` (#5101)
  * watcher: pass site instance to watch plugin (#5109)
  * Show liquid warnings. (#5129)
  * Add `--baseurl` to `build` subcommand (#5135)

### Bug Fixes

  * Site Template: Added a default lang attribute (#4633)
  * Site template: Escape title and description where it is used in HTML (#4606)
  * `Document#date`: drafts which have no date should use source file mtime (#4611)
  * `Filters#time`: clone an input Time so as to be non-destructive (#4590)
  * Doctor: fix issue where `--config` wasn't a recognized flag (#4598)
  * Ensures `related_posts` are only set for a post (#4620)
  * `EntryFilter#special?`: ignore filenames which begin with `~` (#4491)
  * Cleaner: `keep_files` should only apply to the beginning of paths, not substrings with index > 0 (#3849)
  * Use SSLEnable instead of EnableSSL and make URL HTTPS. (#4693)
  * convertible: use `Document::YAML_FRONT_MATTER_REGEXP` to parse transformable files (#4786)
  * Example in the site template should be IANA-approved example.com (#4793)
  * 3.2.x/master: Fix defaults for Documents (posts/collection docs) (#4808)
  * Don't rescue LoadError or bundler load errors for Bundler. (#4857)
  * `Serve.process` should receive same config as `Build.process` (#4953)
  * Prevent reset of page in Liquid payload right before rendering layouts (#5009)
  * Add missing fields to ExcerptDrop (#5067)
  * Stringify configuration overrides before first use (#5060)
  * hooks: move `after_init` hook call at the end of `Site#initialize` (#5106)
  * filters: raise error if no input given to date filters (#5127)
  * `where_exp` filter should filter posts (#4860)

### Forward Ports

  * From v3.1.4: Add ExcerptDrop and remove excerpt's ability to refer to itself in Liquid (#4941)
  * From v3.1.4: Configuration permalink fix and addition of Configuration.from and sorting `site.collections` by label (#4942)
  * From v3.1.4: Fix `{{ layout }}` oddities (proper inheritance & fixing overflow of old data) (#4943)
  * From v3.1.5: Sort the results of the `require_all` glob (#4944)
  * From v3.1.6: Add ability to render drops as JSON (#4945)

### Development Fixes

  * Add project maintainer profile links (#4591)
  * Fix state leakage in Kramdown test (#4618)
  * Unify method for copying special files from repo to site (#4601)
  * Refresh the contributing file (#4596)
  * change smartify doc from copy/paste of mardownify doc (#4653)
  * Update Rake & disable warnings when running tests (#4720)
  * Fix many warnings (#4537)
  * Don't blindly assume the last system when determining "open" cmd (#4717)
  * Fix "locally" typo in contributing documentation (#4756)
  * Update Rubocop rules (#4886)
  * Flesh out the issue template to be much more detailed (#4849)
  * Fixing rubocop offenses in lib/jekyll/cleaner.rb (#4892)
  * Update `jekyll/commands*` to pass rubocop rules (#4888)
  * Clean up many test files to pass Rubocop rules (#4902)
  * Rubocop cleanup for some utils and further test files (#4916)
  * Rubocop: Low hanging fruit (#4936)
  * Rubocop: `Drop` changes from v3.1 forward-ports (#4949)
  * Rubocop: cleanup for misc files (#4946)
  * Rubocop: Stevenson (#4951)
  * Rubocop: lib/jekyll/entry_filter.rb (#4950)
  * Rubocop: `test/*` (#4947)
  * Rubocop: features (#4934)
  * Rubocop: Liquid renderer (#4933)
  * Rubocop: converters (#4931)
  * Rubocop: Site Drop (#4948)
  * Rubocop: tags (#4938)
  * Rubocop: Readers (#4932)
  * rubocop: jekyll/lib/frontmatter_defaults.rb (#4974)
  * rubocop: features/step_definitions.rb (#4956)
  * Rubocop theme and url jekyll libs (#4959)
  * Rubocop jekyll.rb (#4966)
  * Rubocop: use %r for all regular expressions. (#4979)
  * Cleanup and make misc files compliant with Rubocop. (#4940)
  * Rubocop: jekyll/lib/site.rb (#4973)
  * Add timings for each scenario in cucumber & print worst offenders (#4908)
  * rubocop: jekyll/lib/filters.rb (#4993)
  * Fix rubocop offenses in exe/jekyll (#5017)
  * Rubocop: lib/jekyll/command.rb (#5018)
  * rubocop: lib/jekyll/static_file.rb (#5019)
  * rubocop: lib/jekyll/utils.rb (#5026)
  * rubocop: lib/jekyll/regenerator.rb (#5025)
  * rubocop: lib/jekyll/configuration.rb (#5024)
  * rubocop: lib/jekyll/renderer.rb style fixes (#5032)
  * rubocop: lib/jekyll/convertible.rb style fixes (#5031)
  * rubocop: lib/jekyll/document.rb style fixes (#5030)
  * Remove ruby-head from Travis matrix & fix jruby failures (#5015)
  * Remove useless statement from Configuration test (#5065)
  * Change baseurl to example.com for some test cases (#5068)
  * use activesupport < 5 if we are on a Ruby < 2.2.2 (#5100)
  * Internal documentation for working on Jekyll (#5011)
  * rubocop: lib/jekyll/collection.rb (#5022)
  * tests: Typo fixes. (#5114)
  * Normalize yml files. (#5116)
  * Whitespace cleanup. (#5113)
  * Add AppVeyor support. (#5115)
  * appveyor.yml: drop Ruby 2.0.0. (#5119)
  * Fix indentation in benchmark (#5124)
  * Style fixes for Rubocop 0.42.0 - var == 0 becomes var.zero? - when defining method_missing, also define respond_to_missing? (#5137)

### Site Enhancements

  * Add jekyll-seo-tag, jekyll-avatar, and jekyll-sitemap to the site (#4553)
  * Add Google search query to /docs/help/ (#4589)
  * Upgrading, documentation (#4597)
  * Add 'view source' entry (#4602)
  * Add jekyll-video-embed to list of third-party plugins. (#4621)
  * Adding Aerobatic to list of deployment options (#4630)
  * Update documentation: HTMLProofer CLI command (#4641)
  * Document that subdirectories of `_posts` are no longer categories (#4639)
  * Update continuous-integration docs with sudo: false information (#4628)
  * Blog post on refreshed contributing file and new affinity teams (#4645)
  * Fixes typo on collections (#4647)
  * Documentation: future option also works for collections (#4682)
  * Additional package needed for Fedora 23 Workspace (#4685)
  * Fix typo on Chocolatey name in Windows documentation (#4686)
  * Use the correct URL, Fixes #4698 (#4699)
  * Add jekyll-paspagon plugin (#4700)
  * Bold-italicize note in assets documentation about needing yaml front matter (#4706)
  * Highlight the `script/` calls in the Contributing documentation (#4712)
  * Add Hawkins to the list of third-party plugins (#4755)
  * Fix a typo in pagination doc (#4763)
  * Switch second GitHub Pages link to HTTPS (#4760)
  * Explain data file format requirements more clearly in documentation (#4781)
  * Add jekyll-i18n_tags to list of third-party plugins (#4775)
  * Remove Leonard Lamprecht's website from Sites page (#4771)
  * Updates documentation for collections to include `date` property (#4769)
  * Added an explicit rerun note to configuration.md, defaults section (#4734)
  * Update Rack-Jekyll Heroku deployment blog post url (#4789)
  * Added missing single quote on rsync client side command (#4813)
  * Organize Form Platforms-as-a-Service into unified list & add FormSpree.io (#4754)
  * Fixed typo on Configuration page (#4804)
  * Update FormKeep URL on the Resources doc (#4844)
  * site: use liquid & reduce some whitespace noise (#4854)
  * Add jekyll-breadcrumbs to list of third-party plugins (#4874)
  * Added Pug converter to list of third-party plugins (#4872)
  * Add jekyll-ideal-image-slider to list of third-party plugins (#4863)
  * Add Jekyll Tips and the Cheatsheet to the list of resources (#4887)
  * Removed extra `</p>` from `site/_docs/permalinks.md` (#4890)
  * Add pubstorm deployment instructions to docs (#4881)
  * Corrected pagination docs for hidden: true feature (#4903)
  * Remove a Broken Link for Refheap Plugin (#4971)
  * Instructions on how to install github-gem on Windows (#4975)
  * Minor tweak to fix missing apostrophne (#4962)
  * Instructions on how to install github-gem on Windows (v2) (#4977)
  * Fix inaccurate HTTP response header field name (#4976)
  * Add post about GSoC project (#4980)
  * Link to the HTML page instead of Markdown (#4985)
  * Update normalize.css to v4.0.0. (#4989)
  * Add jekyll-tags-list-plugin to list of third-party plugins (#5000)
  * Windows docs: Command needs to be called from blog path (#5006)
  * Update text to be consitent with example (#5010)
  * Update template links to point to core Liquid site (#5012)
  * Add generator-jekyllized to third-party plugins (#5027)
  * Add Jekyll Art Hallery generator plugin to list of third-party plugins (#5043)
  * Add Formingo to the list of Jekyll form SaaS (#5054)
  * Highlight help nav item when navigated to. (#5058)
  * Update normalize.css to v4.2.0. (#5096)
  * Updates html-proofer code (#5098)
  * Jekyll Community (#5097)
  * Typo in documentation file templates.md (#5117)
  * Slightly, improve PNG compression. (#5112)
  * docs: add jekyll-maps plugin reference (#5123)
  * docs: fix link to plugins page source (#5122)
  * Update the configuration docs to match the code (#5131)
  * Removed confusing word repetition. (#5139)
  * Add a note about script/fmt (#5138)

## 3.1.6 / 2016-05-19

### Bug Fixes

  * Add ability to `jsonify` Drops such that, e.g. `site | jsonify`, works. (#4914)

## 3.1.5 / 2016-05-18

### Bug Fixes

  * Sort the results of the `require_all` glob (affects Linux only). (#4912)

## 3.1.4 / 2016-05-18

### Bug Fixes

  * Add `ExcerptDrop` and remove excerpt's ability to refer to itself in Liquid (#4907)
  * Configuration permalink fix where `collections.posts.permalink` inherits properly from `permalink` only when it doesn't exist (#4910)
  * Add `Configuration.from` to make it easier to build configs from just a hash
  * Sorting `site.collections` in Liquid by label (#4910)
  * Fix bug where `layout` in Liquid would inherit from previously-rendered layouts' metadatas (#4909)
  * Fix bug where `layout` in Liquid would override in the wrong direction (more-specific layouts' data were overwritten by their parent layouts' data; this has now been reversed) (#4909)

## 3.1.3 / 2016-04-18

  * Fix defaults for Documents to lookup defaults based on `relative_path` instead of `url` (#4807)
  * Use SSLEnable instead of EnableSSL and make URL HTTPS (WEBrick) (#4693)

## 3.1.2 / 2016-02-19

### Minor Enhancements

  * Include `.rubocop.yml` in Gem (#4437)
  * `LiquidRenderer#parse`: parse with line numbers. (#4452)
  * Add consistency to the no-subcommand deprecation message (#4505)

### Bug Fixes

  * Fix syntax highlighting in kramdown by making `@config` accessible in the Markdown converter. (#4428)
  * `Jekyll.sanitized_path`: sanitizing a questionable path should handle tildes (#4492)
  * Fix `titleize` so already capitalized words are not dropped (#4525)
  * Permalinks which end in a slash should always output HTML (#4546)

### Development Fixes

  * Require at least cucumber version 2.1.0 (#4514)

### Site Enhancements

  * Add jekyll-toc plugin (#4429)
  * Docs: Quickstart - added documentation about the `--force` option (#4410)
  * Fix broken links to the Code of Conduct (#4436)
  * Upgrade notes: mention trailing slash in permalink; fixes #4440 (#4455)
  * Add hooks to the plugin categories toc (#4463)
  * Jekyll 3 requires newer version of Ruby. (#4461)
  * Fix typo in upgrading docs (#4473)
  * Add note about upgrading documentation on jekyllrb.com/help/ (#4484)
  * Update Rake link (#4496)
  * Update & prune the short list of example sites (#4374)
  * Added amp-jekyll plugin to plugins docs (#4517)
  * A few grammar fixes (#4512)
  * Correct a couple mistakes in structure.md (#4522)

## 3.1.1 / 2016-01-29

### Meta

  * Update the Code of Conduct to the latest version (#4402)

### Bug Fixes

  * `Page#dir`: ensure it ends in a slash (#4403)
  * Add `Utils.merged_file_read_opts` to unify reading & strip the BOM (#4404)
  * `Renderer#output_ext`: honor folders when looking for ext (#4401)

### Development Fixes

  * Suppress stdout in liquid profiling test (#4409)

## 3.1.0 / 2016-01-23

### Minor Enhancements

  * Use `Liquid::Drop`s instead of `Hash`es in `#to_liquid` (#4277)
  * Add 'sample' Liquid filter Equivalent to Array#sample functionality (#4223)
  * Cache parsed include file to save liquid parsing time. (#4120)
  * Slightly speed up url sanitization and handle multiples of ///. (#4168)
  * Print debug message when a document is skipped from reading (#4180)
  * Include tag should accept multiple variables in the include name (#4183)
  * Add `-o` option to serve command which opens server URL (#4144)
  * Add CodeClimate platform for better code quality. (#4220)
  * General improvements for WEBrick via jekyll serve such as SSL & custom headers (#4224, #4228)
  * Add a default charset to content-type on webrick. (#4231)
  * Switch `PluginManager` to use `require_with_graceful_fail` for better UX (#4233)
  * Allow quoted date in front matter defaults (#4184)
  * Add a Jekyll doctor warning for URLs that only differ by case (#3171)
  * drops: create one base Drop class which can be set as mutable or not (#4285)
  * drops: provide `#to_h` to allow for hash introspection (#4281)
  * Shim subcommands with indication of gem possibly required so users know how to use them (#4254)
  * Add smartify Liquid filter for SmartyPants (#4323)
  * Raise error on empty permalink (#4361)
  * Refactor Page#permalink method (#4389)

### Bug Fixes

  * Pass build options into `clean` command (#4177)
  * Allow users to use .htm and .xhtml (XHTML5.) (#4160)
  * Prevent Shell Injection. (#4200)
  * Convertible should make layout data accessible via `layout` instead of `page` (#4205)
  * Avoid using `Dir.glob` with absolute path to allow special characters in the path (#4150)
  * Handle empty config files (#4052)
  * Rename `@options` so that it does not impact Liquid. (#4173)
  * utils/drops: update Drop to support `Utils.deep_merge_hashes` (#4289)
  * Make sure jekyll/drops/drop is loaded first. (#4292)
  * Convertible/Page/Renderer: use payload hash accessor & setter syntax for backwards-compatibility (#4311)
  * Drop: fix hash setter precendence (#4312)
  * utils: `has_yaml_header?` should accept files with extraneous spaces (#4290)
  * Escape html from site.title and page.title in site template (#4307)
  * Allow custom file extensions if defined in `permalink` YAML front matter (#4314)
  * Fix deep_merge_hashes! handling of drops and hashes (#4359)
  * Page should respect output extension of its permalink (#4373)
  * Disable auto-regeneration when running server detached (#4376)
  * Drop#: only use public_send for keys in the content_methods array (#4388)
  * Extract title from filename successfully when no date. (#4195)

### Development Fixes

  * `jekyll-docs` should be easily release-able (#4152)
  * Allow use of Cucumber 2.1 or greater (#4181)
  * Modernize Kramdown for Markdown converter. (#4109)
  * Change TestDoctorCommand to JekyllUnitTest... (#4263)
  * Create namespaced rake tasks in separate `.rake` files under `lib/tasks` (#4282)
  * markdown: refactor for greater readability & efficiency (#3771)
  * Fix many Rubocop style errors (#4301)
  * Fix spelling of "GitHub" in docs and history (#4322)
  * Reorganize and cleanup the Gemfile, shorten required depends. (#4318)
  * Remove script/rebund. (#4341)
  * Implement codeclimate platform (#4340)
  * Remove ObectSpace dumping and start using inherited, it's faster. (#4342)
  * Add script/travis so all people can play with Travis-CI images. (#4338)
  * Move Cucumber to using RSpec-Expections and furthering JRuby support. (#4343)
  * Rearrange Cucumber and add some flair. (#4347)
  * Remove old FIXME (#4349)
  * Clean up the Gemfile (and keep all the necessary dependencies) (#4350)

### Site Enhancements

  * Add three plugins to directory (#4163)
  * Add upgrading docs from 2.x to 3.x (#4157)
  * Add `protect_email` to the plugins index. (#4169)
  * Add `jekyll-deploy` to list of third-party plugins (#4179)
  * Clarify plugin docs (#4154)
  * Add Kickster to deployment methods in documentation (#4190)
  * Add DavidBurela's tutorial for Windows to Windows docs page (#4210)
  * Change GitHub code block to highlight tag to avoid it overlaps parent div (#4121)
  * Update FormKeep link to be something more specific to Jekyll (#4243)
  * Remove example Roger Chapman site, as the domain doesn't exist (#4249)
  * Added configuration options for `draft_posts` to configuration docs (#4251)
  * Fix checklist in `_assets.md` (#4259)
  * Add Markdown examples to Pages docs (#4275)
  * Add jekyll-paginate-category to list of third-party plugins (#4273)
  * Add `jekyll-responsive_image` to list of third-party plugins (#4286)
  * Add `jekyll-commonmark` to list of third-party plugins (#4299)
  * Add documentation for incremental regeneration (#4293)
  * Add note about removal of relative permalink support in upgrading docs (#4303)
  * Add Pro Tip to use front matter variable to create clean URLs (#4296)
  * Fix grammar in the documentation for posts. (#4330)
  * Add documentation for smartify Liquid filter (#4333)
  * Fixed broken link to blog on using mathjax with jekyll (#4344)
  * Documentation: correct reference in Precedence section of Configuration docs (#4355)
  * Add @jmcglone's guide to github-pages doc page (#4364)
  * Added the Wordpress2Jekyll Wordpress plugin (#4377)
  * Add Contentful Extension to list of third-party plugins (#4390)
  * Correct Minor spelling error (#4394)

## 3.0.5 / 2016-04-26

  * Remove call to `#backwards_compatibilize` in `Configuration.from` (#4846)

## 3.0.4 / 2016-04-18

  * Fix defaults for Documents to lookup defaults based on `relative_path` instead of `url` (#4806)
  * Configuration: allow users to specify a `collections.posts.permalink` directly without `permalink` clobbering it (#4753)

## 3.0.3 / 2016-02-08

### Bug Fixes

  * Fix extension weirdness with folders (#4493)
  * EntryFilter: only include 'excluded' log on excluded files (#4479)
  * `Jekyll.sanitized_path`: escape tildes before sanitizing a questionable path (#4468)
  * `LiquidRenderer#parse`: parse with line numbers (#4453)
  * `Document#<=>`: protect against nil comparison in dates. (#4446)

## 3.0.2 / 2016-01-20

### Bug Fixes

  * Document: throw a useful error when an invalid date is given (#4378)

## 3.0.1 / 2015-11-17

### Bug Fixes

  * Document: only superdirectories of the collection are categories (#4110)
  * `Convertible#render_liquid` should use `render!` to cause failure on bad Liquid (#4077)
  * Don't generate `.jekyll-metadata` in non-incremental build (#4079)
  * Set `highlighter` config val to `kramdown.syntax_highlighter` (#4090)
  * Align hooks implementation with documentation (#4104)
  * Fix the deprecation warning in the doctor command (#4114)
  * Fix case in `:title` and add `:slug` which is downcased (#4100)

### Development Fixes

  * Fix test warnings when doing rake {test,spec} or script/test (#4078)

### Site Enhancements

  * Update normalize.css to v3.0.3. (#4085)
  * Update Font Awesome to v4.4.0. (#4086)
  * Adds a note about installing the jekyll-gist gem to make gist tag work (#4101)
  * Align hooks documentation with implementation (#4104)
  * Add Jekyll Flickr Plugin to the list of third party plugins (#4111)
  * Remove link to now-deleted blog post (#4125)
  * Update the liquid syntax in the pagination docs (#4130)
  * Add jekyll-language-plugin to plugins.md (#4134)
  * Updated to reflect feedback in #4129 (#4137)
  * Clarify assets.md based on feedback of #4129 (#4142)
  * Re-correct the liquid syntax in the pagination docs (#4140)

## 3.0.0 / 2015-10-26

### Major Enhancements

  * Liquid profiler (i.e. know how fast or slow your templates render) (#3762)
  * Incremental regeneration (#3116)
  * Add Hooks: a new kind of plugin (#3553)
  * Upgrade to Liquid 3.0.0 (#3002)
  * `site.posts` is now a Collection instead of an Array (#4055)
  * Add basic support for JRuby (commit: 0f4477)
  * Drop support for Ruby 1.9.3. (#3235)
  * Support Ruby v2.2 (#3234)
  * Support RDiscount 2 (#2767)
  * Remove most runtime deps (#3323)
  * Move to Rouge as default highlighter (#3323)
  * Mimic GitHub Pages `.html` extension stripping behavior in WEBrick (#3452)
  * Always include file extension on output files (#3490)
  * Improved permalinks for pages and collections (#3538)
  * Sunset (i.e. remove) Maruku (#3655)
  * Remove support for relative permalinks (#3679)
  * Iterate over `site.collections` as an array instead of a hash. (#3670)
  * Adapt StaticFile for collections, config defaults (#3823)
  * Add a Code of Conduct for the Jekyll project (#3925)
  * Added permalink time variables (#3990)
  * Add `--incremental` flag to enable incremental regen (disabled by default) (#4059)

### Minor Enhancements

  * Deprecate access to Document#data properties and Collection#docs methods (#4058)
  * Sort static files just once, and call `site_payload` once for all collections (#3204)
  * Separate `jekyll docs` and optimize external gem handling (#3241)
  * Improve `Site#getConverterImpl` and call it `Site#find_converter_instance` (#3240)
  * Use relative path for `path` Liquid variable in Documents for consistency (#2908)
  * Generalize `Utils#slugify` for any scripts (#3047)
  * Added basic microdata to post template in site template (#3189)
  * Store log messages in an array of messages. (#3244)
  * Allow collection documents to override `output` property in front matter (#3172)
  * Keep file modification times between builds for static files (#3220)
  * Only downcase mixed-case categories for the URL (#2571)
  * Added per post `excerpt_separator` functionality (#3274)
  * Allow collections YAML to end with three dots (#3134)
  * Add mode parameter to `slugify` Liquid filter (#2918)
  * Perf: `Markdown#matches` should avoid regexp (#3321)
  * Perf: Use frozen regular expressions for `Utils#slugify` (#3321)
  * Split off Textile support into jekyll-textile-converter (#3319)
  * Improve the navigation menu alignment in the site template on small screens (#3331)
  * Show the regeneration time after the initial generation (#3378)
  * Site template: Switch default font to Helvetica Neue (#3376)
  * Make the `include` tag a teensy bit faster. (#3391)
  * Add `pkill -f jekyll` to ways to kill. (#3397)
  * Site template: collapsed, variable-driven font declaration (#3360)
  * Site template: Don't always show the scrollbar in code blocks (#3419)
  * Site template: Remove undefined `text` class from `p` element (#3440)
  * Site template: Optimize text rendering for legibility (#3382)
  * Add `draft?` method to identify if Post is a Draft & expose to Liquid (#3456)
  * Write regeneration metadata even on full rebuild (#3464)
  * Perf: Use `String#end_with?("/")` instead of regexp when checking paths (#3516)
  * Docs: document 'ordinal' built-in permalink style (#3532)
  * Upgrade liquid-c to 3.x (#3531)
  * Use consistent syntax for deprecation warning (#3535)
  * Added build --destination and --source flags (#3418)
  * Site template: remove unused `page.meta` attribute (#3537)
  * Improve the error message when sorting null objects (#3520)
  * Added liquid-md5 plugin (#3598)
  * Documentation: RR replaced with RSpec Mocks (#3600)
  * Documentation: Fix subpath. (#3599)
  * Create 'tmp' dir for test_tags if it doesn't exist (#3609)
  * Extract reading of data from `Site` to reduce responsibilities. (#3545)
  * Removed the word 'Jekyll' a few times from the comments (#3617)
  * `bin/jekyll`: with no args, exit with exit code 1 (#3619)
  * Incremental build if destination file missing (#3614)
  * Static files `mtime` liquid should return a `Time` obj (#3596)
  * Use `Jekyll::Post`s for both LSI indexing and lookup. (#3629)
  * Add `charset=utf-8` for HTML and XML pages in WEBrick (#3649)
  * Set log level to debug when verbose flag is set (#3665)
  * Added a mention on the Gemfile to complete the instructions (#3671)
  * Perf: Cache `Document#to_liquid` and invalidate where necessary (#3693)
  * Perf: `Jekyll::Cleaner#existing_files`: Call `keep_file_regex` and `keep_dirs` only once, not once per iteration (#3696)
  * Omit jekyll/jekyll-help from list of resources. (#3698)
  * Add basic `jekyll doctor` test to detect fsnotify (OSX) anomalies. (#3704)
  * Added talk.jekyllrb.com to "Have questions?" (#3694)
  * Performance: Sort files only once (#3707)
  * Performance: Marshal metadata (#3706)
  * Upgrade highlight wrapper from `div` to `figure` (#3779)
  * Upgrade mime-types to `~> 2.6` (#3795)
  * Update windows.md with Ruby version info (#3818)
  * Make the directory for includes configurable (#3782)
  * Rename directory configurations to match `*_dir` convention for consistency (#3782)
  * Internal: trigger hooks by owner symbol (#3871)
  * Update MIME types from mime-db (#3933)
  * Add header to site template `_config.yml` for clarity & direction (#3997)
  * Site template: add timezone offset to post date frontmatter (#4001)
  * Make a constant for the regex to find hidden files (#4032)
  * Site template: refactor github & twitter icons into includes (#4049)
  * Site template: add background to Kramdown Rouge-ified backtick code blocks (#4053)

### Bug Fixes

  * `post_url`: fix access deprecation warning & fix deprecation msg (#4060)
  * Perform jekyll-paginate deprecation warning correctly. (#3580)
  * Make permalink parsing consistent with pages (#3014)
  * `time()`pre-filter method should accept a `Date` object (#3299)
  * Remove unneeded end tag for `link` in site template (#3236)
  * Kramdown: Use `enable_coderay` key instead of `use_coderay` (#3237)
  * Unescape `Document` output path (#2924)
  * Fix nav items alignment when on multiple rows (#3264)
  * Highlight: Only Strip Newlines/Carriage Returns, not Spaces (#3278)
  * Find variables in front matter defaults by searching with relative file path. (#2774)
  * Allow variables (e.g `:categories`) in YAML front matter permalinks (#3320)
  * Handle nil URL placeholders in permalinks (#3325)
  * Template: Fix nav items alignment when in "burger" mode (#3329)
  * Template: Remove `!important` from nav SCSS introduced in #3329 (#3375)
  * The `:title` URL placeholder for collections should be the filename slug. (#3383)
  * Trim the generate time diff to just 3 places past the decimal place (#3415)
  * The highlight tag should only clip the newlines before and after the *entire* block, not in between (#3401)
  * highlight: fix problem with linenos and rouge. (#3436)
  * `Site#read_data_file`: read CSV's with proper file encoding (#3455)
  * Ignore `.jekyll-metadata` in site template (#3496)
  * Template: Point documentation link to the documentation pages (#3502)
  * Removed the trailing slash from the example `/blog` baseurl comment (#3485)
  * Clear the regenerator cache every time we process (#3592)
  * Readd (bring back) minitest-profile (#3628)
  * Add WOFF2 font MIME type to Jekyll server MIME types (#3647)
  * Be smarter about extracting the extname in `StaticFile` (#3632)
  * Process metadata for all dependencies (#3608)
  * Show error message if the YAML front matter on a page/post is invalid. (#3643)
  * Upgrade redcarpet to 3.2 (Security fix: OSVDB-120415) (#3652)
  * Create #mock_expects that goes directly to RSpec Mocks. (#3658)
  * Open `.jekyll-metadata` in binary mode to read binary Marshal data (#3713)
  * Incremental regeneration: handle deleted, renamed, and moved dependencies (#3717)
  * Fix typo on line 19 of pagination.md (#3760)
  * Fix it so that 'blog.html' matches 'blog.html' (#3732)
  * Remove occasionally-problematic `ensure` in `LiquidRenderer` (#3811)
  * Fixed an unclear code comment in site template SCSS (#3837)
  * Fix reading of binary metadata file (#3845)
  * Remove var collision with site template header menu iteration variable (#3838)
  * Change non-existent `hl_linenos` to `hl_lines` to allow passthrough in safe mode (#3787)
  * Add missing flag to disable the watcher (#3820)
  * Update CI guide to include more direct explanations of the flow (#3891)
  * Set `future` to `false` in the default config (#3892)
  * filters: `where` should compare stringified versions of input & comparator (#3935)
  * Read build options for `jekyll clean` command (#3828)
  * Fix #3970: Use Gem::Version to compare versions, not `>`.
  * Abort if no subcommand. Fixes confusing message. (#3992)
  * Whole-post excerpts should match the post content (#4004)
  * Change default font weight to 400 to fix bold/strong text issues (#4050)
  * Document: Only auto-generate the excerpt if it's not overridden (#4062)
  * Utils: `deep_merge_hashes` should also merge `default_proc` (45f69bb)
  * Defaults: compare paths in `applies_path?` as `String`s to avoid confusion (7b81f00)

### Development Fixes

  * Remove loader.rb and "modernize" `script/test`. (#3574)
  * Improve the grammar in the documentation (#3233)
  * Update the LICENSE text to match the MIT license exactly (#3253)
  * Update rake task `site:publish` to fix minor bugs. (#3254)
  * Switch to shields.io for the README badges. (#3255)
  * Use `FileList` instead of `Dir.glob` in `site:publish` rake task (#3261)
  * Fix test script to be platform-independent (#3279)
  * Instead of symlinking `/tmp`, create and symlink a local `tmp` in the tests (#3258)
  * Fix some spacing (#3312)
  * Fix comment typo in `lib/jekyll/frontmatter_defaults.rb` (#3322)
  * Move all `regenerate?` checking to `Regenerator` (#3326)
  * Factor out a `read_data_file` call to keep things clean (#3380)
  * Proof the site with CircleCI. (#3427)
  * Update LICENSE to 2015. (#3477)
  * Upgrade tests to use Minitest (#3492)
  * Remove trailing whitespace (#3497)
  * Use `fixture_site` for Document tests (#3511)
  * Remove adapters deprecation warning (#3529)
  * Minor fixes to `url.rb` to follow GitHub style guide (#3544)
  * Minor changes to resolve deprecation warnings (#3547)
  * Convert remaining textile test documents to markdown (#3528)
  * Migrate the tests to use rspec-mocks (#3552)
  * Remove `activesupport` (#3612)
  * Added tests for `Jekyll:StaticFile` (#3633)
  * Force minitest version to 5.5.1 (#3657)
  * Update the way cucumber accesses Minitest assertions (#3678)
  * Add `script/rubyprof` to generate cachegrind callgraphs (#3692)
  * Upgrade cucumber to 2.x (#3795)
  * Update Kramdown. (#3853)
  * Updated the scripts shebang for portability (#3858)
  * Update JRuby testing to 9K ([3ab386f](https://github.com/jekyll/jekyll/commit/3ab386f1b096be25a24fe038fc70fd0fb08d545d))
  * Organize dependencies into dev and test groups. (#3852)
  * Contributing.md should refer to `script/cucumber` (#3894)
  * Update contributing documentation to reflect workflow updates (#3895)
  * Add script to vendor mime types (#3933)
  * Ignore .bundle dir in SimpleCov (#4033)

### Site Enhancements

  * Add 'info' labels to certain notes in collections docs (#3601)
  * Remove extra spaces, make the last sentence less awkward in permalink docs (#3603)
  * Update the permalinks documentation to reflect the updates for 3.0 (#3556)
  * Add blog post announcing Jekyll Help (#3523)
  * Add Jekyll Talk to Help page on site (#3518)
  * Change Ajax pagination resource link to use HTTPS (#3570)
  * Fixing the default host on docs (#3229)
  * Add `jekyll-thumbnail-filter` to list of third-party plugins (#2790)
  * Add link to 'Adding Ajax pagination to Jekyll' to Resources page (#3186)
  * Add a Resources link to tutorial on building dynamic navbars (#3185)
  * Semantic structure improvements to the post and page layouts (#3251)
  * Add new AsciiDoc plugin to list of third-party plugins. (#3277)
  * Specify that all transformable collection documents must contain YAML front matter (#3271)
  * Assorted accessibility fixes (#3256)
  * Update configuration docs to mention `keep_files` for `destination` (#3288, #3296)
  * Break when we successfully generate nav link to save CPU cycles. (#3291)
  * Update usage docs to mention `keep_files` and a warning about `destination` cleaning (#3295)
  * Add logic to automatically generate the `next_section` and `prev_section` navigation items (#3292)
  * Some small fixes for the Plugins TOC. (#3306)
  * Added versioning comment to configuration file (#3314)
  * Add `jekyll-minifier` to list of third-party plugins (#3333)
  * Add blog post about the Jekyll meet-up (#3332)
  * Use `highlight` Liquid tag instead of the four-space tabs for code (#3336)
  * 3.0.0.beta1 release post (#3346)
  * Add `twa` to the list of third-party plugins (#3384)
  * Remove extra spaces (#3388)
  * Fix small grammar errors on a couple pages (#3396)
  * Fix typo on Templates docs page (#3420)
  * s/three/four for plugin type list (#3424)
  * Release jekyllrb.com as a locally-compiled site. (#3426)
  * Add a jekyllrb.com/help page which elucidates places from which to get help (#3428)
  * Remove extraneous dash on Plugins doc page which caused a formatting error (#3431)
  * Fix broken link to Jordan Thornquest's website. (#3438)
  * Change the link to an extension (#3457)
  * Fix Twitter link on the help page (#3466)
  * Fix wording in code snippet highlighting section (#3475)
  * Add a `/` to `paginate_path` in the Pagination documentation (#3479)
  * Add a link on all the docs pages to "Improve this page". (#3510)
  * Add jekyll-auto-image generator to the list of third-party plugins (#3489)
  * Replace link to the proposed `picture` element spec (#3530)
  * Add frontmatter date formatting information (#3469)
  * Improve consistency and clarity of plugins options note (#3546)
  * Add permalink warning to pagination docs (#3551)
  * Fix grammar in Collections docs API stability warning (#3560)
  * Restructure `excerpt_separator` documentation for clarity (#3550)
  * Fix accidental line break in collections docs (#3585)
  * Add information about the `.jekyll-metadata` file (#3597)
  * Document addition of variable parameters to an include (#3581)
  * Add `jekyll-files` to the list of third-party plugins. (#3586)
  * Define the `install` step in the CI example `.travis.yml` (#3622)
  * Expand collections documentation. (#3638)
  * Add the "warning" note label to excluding `vendor` in the CI docs page (#3623)
  * Upgrade pieces of the Ugrading guide for Jekyll 3 (#3607)
  * Showing how to access specific data items (#3468)
  * Clarify pagination works from within HTML files (#3467)
  * Add note to `excerpt_separator` documentation that it can be set globally (#3667)
  * Fix some names on Troubleshooting page (#3683)
  * Add `remote_file_content` tag plugin to list of third-party plugins (#3691)
  * Update the Redcarpet version on the Configuration page. (#3743)
  * Update the link in the welcome post to point to Jekyll Talk (#3745)
  * Update link for navbars with data attributes tutorial (#3728)
  * Add `jekyll-asciinema` to list of third-party plugins (#3750)
  * Update pagination example to be agnostic to first pagination dir (#3763)
  * Detailed instructions for rsync deployment method (#3848)
  * Add Jekyll Portfolio Generator to list of plugins (#3883)
  * Add `site.html_files` to variables docs (#3880)
  * Add Static Publisher tool to list of deployment methods (#3865)
  * Fix a few typos. (#3897)
  * Add `jekyll-youtube` to the list of third-party plugins (#3931)
  * Add Views Router plugin (#3950)
  * Update install docs (Core dependencies, Windows reqs, etc) (#3769)
  * Use Jekyll Feed for jekyllrb.com (#3736)
  * Add jekyll-umlauts to plugins.md ($3966)
  * Troubleshooting: fix broken link, add other mac-specific info (#3968)
  * Add a new site for learning purposes (#3917)
  * Added documentation for Jekyll environment variables (#3989)
  * Fix broken configuration documentation page (#3994)
  * Add troubleshooting docs for installing on El Capitan (#3999)
  * Add Lazy Tweet Embedding to the list of third-party plugins (#4015)
  * Add installation instructions for 2 of 3 options for plugins (#4013)
  * Add alternative jekyll gem installation instructions (#4018)
  * Fix a few typos and formatting problems. (#4022)
  * Fix pretty permalink example (#4029)
  * Note that `_config.yml` is not reloaded during regeneration (#4034)
  * Apply code block figure syntax to blocks in CONTRIBUTING (#4046)
  * Add jekyll-smartify to the list of third-party plugins (#3572)

## 2.5.3 / 2014-12-22

### Bug Fixes

  * When checking a Markdown extname, include position of the `.` (#3147)
  * Fix `jsonify` Liquid filter handling of boolean values (#3154)
  * Add comma to value of `viewport` meta tag (#3170)
  * Set the link type for the RSS feed to `application/rss+xml` (#3176)
  * Refactor `#as_liquid` (#3158)

### Development Fixes

  * Exclude built-in bundles from being added to coverage report (#3180)

### Site Enhancements

  * Add @alfredxing to the @jekyll/core team. :tada: (#3218)
  * Document the `-q` option for the `build` and `serve` commands (#3149)
  * Fix some minor typos/flow fixes in documentation website content (#3165)
  * Add `keep_files` to configuration documentation (#3162)
  * Repeat warning about cleaning of the `destination` directory (#3161)
  * Add jekyll-500px-embed to list of third-party plugins (#3163)
  * Simplified platform detection in Gemfile example for Windows (#3177)
  * Add the `jekyll-jalali` plugin added to the list of third-party plugins. (#3198)
  * Add Table of Contents to Troubleshooting page (#3196)
  * Add `inline_highlight` plugin to list of third-party plugins (#3212)
  * Add `jekyll-mermaid` plugin to list of third-party plugins (#3222)

## 2.5.2 / 2014-11-17

### Minor Enhancements

  * `post_url` should match `post.name` instead of slugs and dates (#3058)

### Bug Fixes

  * Fix bundle require for `:jekyll_plugins` (#3119)
  * Remove duplicate regexp phrase: `^\A` (#3089)
  * Remove duplicate `Conversion error:` message in `Convertible` (#3088)
  * Print full conversion error message in `Renderer#convert` (#3090)

### Site Enhancements

  * Change variable names in Google Analytics script (#3093)
  * Mention CSV files in the docs for data files (#3101)
  * Add trailing slash to `paginate_path` example. (#3091)
  * Get rid of noifniof (`excerpt_separator`) (#3094)
  * Sass improvements, around nesting mostly. (#3123)
  * Add webmentions.io plugin to the list of third-party plugins (#3127)
  * Add Sass mixins and use them. (#2904)
  * Slightly compress jekyll-sticker.jpg. (#3133)
  * Update gridism and separate out related but custom styles. (#3132)
  * Add remote-include plugin to list of third-party plugins (#3136)

## 2.5.1 / 2014-11-09

### Bug Fixes

  * Fix path sanitation bug related to Windows drive names (#3077)

### Development Fixes

  * Add development time dependencies on minitest and test-unit to gemspec for cygwin (#3064)
  * Use Travis's built-in caching. (#3075)

## 2.5.0 / 2014-11-06

### Minor Enhancements

  * Require gems in `:jekyll_plugins` Gemfile group unless `JEKYLL_NO_BUNDLER_REQUIRE` is specified in the environment. (#2865)
  * Centralize path sanitation in the `Site` object (#2882)
  * Allow placeholders in permalinks (#3031)
  * Allow users to specify the log level via `JEKYLL_LOG_LEVEL`. (#3067)
  * Fancy Indexing with WEBrick (#3018)
  * Allow Enumerables to be used with `where` filter. (#2986)
  * Meta descriptions in the site template now use `page.excerpt` if it's available (#2964)
  * Change indentation in `head.html` of site template to 2 spaces from 4 (#2973)
  * Use a `$content-width` variable instead of a fixed value in the site template CSS (#2972)
  * Strip newlines in site template `<meta>` description. (#2982)
  * Add link to atom feed in `head` of site template files (#2996)
  * Performance optimizations (#2994)
  * Use `Hash#each_key` instead of `Hash#keys.each` to speed up iteration over hash keys. (#3017)
  * Further minor performance enhancements. (#3022)
  * Add 'b' and 's' aliases for build and serve, respectively (#3065)

### Bug Fixes

  * Fix Rouge's RedCarpet plugin interface integration (#2951)
  * Remove `--watch` from the site template blog post since it defaults to watching in in 2.4.0 (#2922)
  * Fix code for media query mixin in site template (#2946)
  * Allow post URLs to have `.htm` extensions (#2925)
  * `Utils.slugify`: Don't create new objects when gsubbing (#2997)
  * The jsonify filter should deep-convert to Liquid when given an Array. (#3032)
  * Apply `jsonify` filter to Hashes deeply and effectively (#3063)
  * Use `127.0.0.1` as default host instead of `0.0.0.0` (#3053)
  * In the case that a Gemfile does not exist, ensure Jekyll doesn't fail on requiring the Gemfile group (#3066)

### Development Fixes

  * Fix a typo in the doc block for `Jekyll::URL.escape_path` (#3052)
  * Add integration test for `jekyll new --blank` in TestUnit (#2913)
  * Add unit test for `jekyll new --force` logic (#2929)
  * Update outdated comment for `Convertible#transform` (#2957)
  * Add Hakiri badge to README. (#2953)
  * Add some simple benchmarking tools. (#2993)

### Site Enhancements

  * `NOKOGIRI_USE_SYSTEM_LIBRARIES=true` **decreases** installation time. (#3040)
  * Add FormKeep to resources as Jekyll form backend (#3010)
  * Fixing a mistake in the name of the new Liquid tag (#2969)
  * Update Font Awesome to v4.2.0. (#2898)
  * Fix link to #2895 in 2.4.0 release post. (#2899)
  * Add Big Footnotes for Kramdown plugin to list of third-party plugins (#2916)
  * Remove warning regarding GHP use of singular types for front matter defaults (#2919)
  * Fix quote character typo in site documentation for templates (#2917)
  * Point Liquid links to Liquid’s GitHub wiki (#2887)
  * Add HTTP Basic Auth (.htaccess) plugin to list of third-party plugins (#2931)
  * (Minor) Grammar & `_config.yml` filename fixes (#2911)
  * Added `mathml.rb` to the list of third-party plugins. (#2937)
  * Add `--force_polling` to the list of configuration options (#2943)
  * Escape unicode characters in site CSS (#2906)
  * Add note about using the github-pages gem via pages.github.com/versions.json (#2939)
  * Update usage documentation to reflect 2.4 auto-enabling of `--watch`. (#2954)
  * Add `--skip-initial-build` to configuration docs (#2949)
  * Fix a minor typo in Templates docs page (#2959)
  * Add a ditaa-ditaa plugin under Other section on the Plugins page (#2967)
  * Add `build/serve -V` option to configuration documentation (#2948)
  * Add 'Jekyll Twitter Plugin' to list of third-party plugins (#2979)
  * Docs: Update normalize.css to v3.0.2. (#2981)
  * Fix typo in Continuous Integration documentation (#2984)
  * Clarify behavior of `:categories` in permalinks (#3011)

## 2.4.0 / 2014-09-09

### Minor Enhancements

  * Support a new `relative_include` tag (#2870)
  * Auto-enable watch on 'serve' (#2858)
  * Render Liquid in CoffeeScript files (#2830)
  * Array Liquid filters: `push`, `pop`, `unshift`, `shift` (#2895)
  * Add `:title` to collection URL template fillers (#2864)
  * Add support for CSV files in the `_data` directory (#2761)
  * Add the `name` variable to collection permalinks (#2799)
  * Add `inspect` liquid filter. (#2867)
  * Add a `slugify` Liquid filter (#2880)

### Bug Fixes

  * Use `Jekyll.sanitized_path` when adding static files to Collections (#2849)
  * Fix encoding of `main.scss` in site template (#2771)
  * Fix orientation bugs in default site template (#2862)

### Development Fixes

  * Update simplecov gem to 0.9 (#2748)
  * Remove `docs/` dir (#2768)
  * add class `<< self` idiom to `New` command (#2817)
  * Allow Travis to 'parallelize' our tests (#2859)
  * Fix test for Liquid rendering in Sass (#2856)
  * Fixing "vertycal" typo in site template's `_base.scss` (#2889)

### Site Enhancements

  * Document the `name` variable for collection permalinks (#2829)
  * Adds info about installing jekyll in current dir (#2839)
  * Remove deprecated `jekyll-projectlist` plugin from list of third-party plugins (#2742)
  * Remove tag plugins that are built in to Jekyll (#2751)
  * Add `markdown-writer` package for Atom Editor to list of third-party plugins (#2763)
  * Fix typo in site documentation for collections (#2764)
  * Fix minor typo on plugins docs page (#2765)
  * Replace markdown with HTML in `sass_dir` note on assets page (#2791)
  * Fixed "bellow" typo in datafiles docs (#2879)
  * Fix code/markdown issue in documentation for variables (#2877)
  * Remove Good Include third-party plugin from plugins page (#2881)
  * Add some more docs on `include_relative` (#2884)

## 2.3.0 / 2014-08-10

### Minor Enhancements

  * Allow Convertibles to be converted by >= 1 converters (#2704)
  * Allow Sass files to be rendered in Liquid, but never place them in layouts. (#2733)
  * Add `jekyll help` command (#2707)
  * Use `.scss` for `site_template` styles. (#2667)
  * Don't require the `scope` key in front matter defaults (#2659)
  * No longer set `permalink: pretty` in the `_config.yml` for the site template (#2680)
  * Rework site template to utilize Sass (#2687)
  * Notify the user when auto-regeneration is disabled. (#2696)
  * Allow partial variables in include tag filename argument (#2693)
  * Move instances of `Time.parse` into a Utils method (#2682)
  * Ignore subfolders in the `_posts` folder (#2705) REVERTS (#2633)
  * Front Matter default types should always be pluralized (#2732)
  * Read in static files into `collection.files` as `StaticFile`s (#2737)
  * Add `sassify` and `scssify` Liquid filters (#2739)
  * Replace `classifier` gem with `classifier-reborn` (#2721)

### Bug Fixes

  * Use only the last extname when multiple converters exist (#2722)
  * Call `#to_liquid` before calling `#to_json` in jsonify filter (#2729)
  * Use non padded config in `strftime` to avoid parse string twice (#2673)
  * Replace deprecated Ruby methods with undeprecated ones (#2664)
  * Catch errors when parsing Post `date` front matter value & produce nice error message (#2649)
  * Allow static files in Collections (#2615)
  * Fixed typo in `Deprecator#gracefully_require` error message (#2694)
  * Remove preemptive loading of the 'classifier' gem. (#2697)
  * Use case-insensitive checking for the file extensions when loading config files (#2718)
  * When Reading Documents, Respect `encoding` Option (#2720)
  * Refactor based on jekyll-watch clean-up. (#2716)
  * `Document#to_s` should produce just the content of the document (#2731)

### Development Fixes

  * Only include lib files in the gem (#2671)
  * Fix `git diff` command in `proof` script (#2672)
  * Make default rake task a multitask so tests run in parallel (#2735)

### Site Enhancements

  * Use Sass and a Docs Collection (#2651)
  * Add `latest_version.txt` file to the site (#2740)
  * Be more ambiguous about `page.content`. But more transparent. (#2522)
  * Streamlining front matter wording (instead of front-matter/frontmatter) (#2674)
  * Add note that source directory cannot be modified in GitHub Pages (#2669)
  * Fix links from #2669 to be actual HTML. Whoops. (#2679)
  * Add link to `jekyll-slim` in list of third-party plugins (#2689)
  * Add Barry Clark's Smashing Magazine tutorial to resources page (#2688)
  * Reorganize and update default configuration settings (#2456)
  * Fixing indentation in the configuration docs about Redcarpet exts (#2717)
  * Use `null` in YAML instead of `nil` in default config list (#2719)
  * Fix typo in Continuous Integration docs (#2708)

## 2.2.0 / 2014-07-29

### Minor Enhancements

  * Throw a warning if the specified layout does not exist (#2620)
  * Whitelist Pygments options in safe mode (#2642)

### Bug Fixes

  * Remove unnecessary `Jekyll::Tags::IncludeTag#blank?` method (#2625)
  * Categories in the path are ignored (#2633)

### Development Fixes

  * Refactoring Errors & Requires of Third-Party stuff (#2591)
  * Add further tests for categories (#2584)
  * Proof site with html-proofer on change (#2605)
  * Fix up bug in #2605 which caused proofing the site not to function (#2608)
  * Use `bundle exec` in `script/proof` (#2610)

### Site Enhancements

  * Update Kramdown urls (#2588)
  * Add `Jekyll::AutolinkEmail` and `Jekyll::GitMetadata` to the list of third-party plugins (#2596)
  * Fix a bunch of broken links in the site (#2601)
  * Replace dead links with working links (#2611)
  * Add jekyll-hook to deployment methods (#2617)
  * Added kramdown-with-pygments plugin to the list of third-party plugins (#2623)
  * Update outdated "Extras" page and remove duplicate documentation (#2622)
  * Add co2 plugin to list of third-party plugins (#2639)
  * Attempt to clarify the way Sass imports happen (#2642)

## 2.1.1 / 2014-07-01

### Bug Fixes

  * Patch read vulnerabilities for data & confirm none for layouts (#2563)
  * Update Maruku dependency to allow use of the latest version (#2576)
  * Remove conditional assignment from document URL to prevent stale urls (#2575)

### Site Enhancements

  * Add vertical margin to `highlight` to separate code blocks (#2558)
  * Add `html_pages` to Variables docs (#2567)
  * Fixed broken link to Permalinks page (#2572)
  * Update link to Windows installation guide (#2578)

## 2.1.0 / 2014-06-28

### Minor Enhancements

  * Bump to the latest Liquid version, 2.6.1 (#2495)
  * Add support for JSON files in the `_data` directory (#2369)
  * Allow subclasses to override `EXCERPT_ATTRIBUTES_FOR_LIQUID` (#2408)
  * Add `Jekyll.env` and `jekyll.environment` (the Liquid var) (#2417)
  * Use `_config.yaml` or `_config.yml` (`.yml` takes precedence) (#2406)
  * Override collection url template (#2418)
  * Allow subdirectories in `_data` (#2395)
  * Extract Pagination Generator into gem: `jekyll-paginate` (#2455)
  * Utilize `date_to_rfc822` filter in site template (#2437)
  * Add categories, last build datetime, and generator to site template feed (#2438)
  * Configurable, replaceable Logger-compliant logger (#2444)
  * Extract `gist` tag into a separate gem (#2469)
  * Add `collection` attribute to `Document#to_liquid` to access the document's collection label. (#2436)
  * Upgrade listen to `2.7.6 <= x < 3.0.0` (#2492)
  * Allow configuration of different Twitter and GitHub usernames in site template (#2485)
  * Bump Pygments to v0.6.0 (#2504)
  * Front matter defaults for documents in collections (#2419)
  * Include files with a url which ends in `/` in the `site.html_pages` list (#2524)
  * Make `highlight` tag use `language-` prefix in CSS class (#2511)
  * Lookup item property via `item#to_liquid` before `#data` or `#[]` in filters (#2493)
  * Skip initial build of site on serve with flag (#2477)
  * Add support for `hl_lines` in `highlight` tag (#2532)
  * Spike out `--watch` flag into a separate gem (#2550)

### Bug Fixes

  * Liquid `sort` filter should sort even if one of the values is `nil` (#2345)
  * Remove padding on `pre code` in the site template CSS (#2383)
  * Set `log_level` earlier to silence info level configuration output (#2393)
  * Only list pages which have `title` in site template (#2411)
  * Accept `Numeric` values for dates, not `Number` values (#2377)
  * Prevent code from overflowing container in site template (#2429)
  * Encode URLs in UTF-8 when escaping and unescaping (#2420)
  * No Layouts or Liquid for Asset Files (#2431)
  * Allow front matter defaults to set post categories (#2373)
  * Fix command in subcommand deprecation warning (#2457)
  * Keep all parent directories of files/dirs in `keep_files` (#2458)
  * When using RedCarpet and Rouge without Rouge installed, fixed erroneous error which stated that redcarpet was missing, not rouge. (#2464)
  * Ignore *all* directories and files that merit it on auto-generation (#2459)
  * Before copying file, explicitly remove the old one (#2535)
  * Merge file system categories with categories from YAML. (#2531)
  * Deep merge front matter defaults (#2490)
  * Ensure exclude and include arrays are arrays of strings (#2542)
  * Allow collections to have dots in their filenames (#2552)
  * Collections shouldn't try to read in directories as files (#2552)
  * Be quiet very quickly. (#2520)

### Development Fixes

  * Test Ruby 2.1.2 instead of 2.1.1 (#2374)
  * Add test for sorting UTF-8 characters (#2384)
  * Use `https` for GitHub links in documentation (#2470)
  * Remove coverage reporting with Coveralls (#2494)
  * Fix a bit of missing TomDoc to `Jekyll::Commands::Build#build` (#2554)

### Site Enhancements

  * Set `timezone` to `America/Los_Angeles` (#2394)
  * Improve JavaScript in `anchor_links.html` (#2368)
  * Remove note on Quickstart page about default markdown converter (#2387)
  * Remove broken link in extras.md to a Maruku fork (#2401)
  * Update Font Awesome to v4.1.0. (#2410)
  * Fix broken link on Installation page to Templates page (#2421)
  * Prevent table from extending parent width in permalink style table (#2424)
  * Add collections to info about pagination support (#2389)
  * Add `jekyll_github_sample` plugin to list of third-party plugins (#2463)
  * Clarify documentation around front matter defaults and add details about defaults for collections. (#2439)
  * Add Jekyll Project Version Tag to list of third-party plugins (#2468)
  * Use `https` for GitHub links across whole site (#2470)
  * Add StickerMule + Jekyll post (#2476)
  * Add Jekyll Asset Pipeline Reborn to list of third-party plugins (#2479)
  * Add link to jekyll-compress-html to list of third-party plugins (#2514)
  * Add Piwigo Gallery to list of third-party plugins (#2526)
  * Set `show_drafts` to `false` in default configuration listing (#2536)
  * Provide an updated link for Windows installation instructions (#2544)
  * Remove `url` from configuration docs (#2547)
  * Documentation for Continuous Integration for your Jekyll Site (#2432)

## 2.0.3 / 2014-05-08

### Bug Fixes

  * Properly prefix links in site template with URL or baseurl depending upon need. (#2319)
  * Update gist tag comments and error message to require username (#2326)
  * Fix `permalink` setting in site template (#2331)
  * Don't fail if any of the path objects are nil (#2325)
  * Instantiate all descendants for converters and generators, not just direct subclasses (#2334)
  * Replace all instances of `site.name` with `site.title` in site template (#2324)
  * `Jekyll::Filters#time` now accepts UNIX timestamps in string or number form (#2339)
  * Use `item_property` for `where` filter so it doesn't break on collections (#2359)
  * Rescue errors thrown so `--watch` doesn't fail (#2364)

### Site Enhancements

  * Add missing "as" to assets docs page (#2337)
  * Update docs to reflect new `baseurl` default (#2341)
  * Add links to headers who have an ID. (#2342)
  * Use symbol instead of HTML number in `upgrading.md` (#2351)
  * Fix link to front matter defaults docs (#2353)
  * Fix for `History.markdown` in order to fix history page in docs (#2363)

## 2.0.2 / 2014-05-07

### Bug Fixes

  * Correct use of `url` and `baseurl` in the site template. (#2317)
  * Default `baseurl` to `""` (#2317)

### Site Enhancements

  * Correct docs for the `gist` plugin so it always includes the username. (#2314)
  * Clarify new (defaults, `where` filter) features in docs (#2316)

## 2.0.1 / 2014-05-06

### Bug Fixes

  * Require `kramdown` gem instead of `maruku` gem

## 2.0.0 / 2014-05-06

### Major Enhancements

  * Add "Collections" feature (#2199)
  * Add gem-based plugin whitelist to safe mode (#1657)
  * Replace the commander command line parser with a more robust solution for our needs called `mercenary` (#1706)
  * Remove support for Ruby 1.8.x (#1780)
  * Move to jekyll/jekyll from mojombo/jekyll (#1817)
  * Allow custom markdown processors (#1872)
  * Provide support for the Rouge syntax highlighter (#1859)
  * Provide support for Sass (#1932)
  * Provide a 300% improvement when generating sites that use `Post#next` or `Post#previous` (#1983)
  * Provide support for CoffeeScript (#1991)
  * Replace Maruku with Kramdown as Default Markdown Processor (#1988)
  * Expose `site.static_files` to Liquid (#2075)
  * Complete redesign of the template site generated by `jekyll new` (#2050)
  * Update Listen from 1.x to 2.x (#2097)
  * Front matter defaults (#2205)
  * Deprecate `relative_permalinks` configuration option (default to `false`) (#2307)
  * Exclude files based on prefix as well as `fnmatch?` (#2303)

### Minor Enhancements

  * Move the EntryFilter class into the Jekyll module to avoid polluting the global namespace (#1800)
  * Add `group_by` Liquid filter create lists of items grouped by a common property's value (#1788)
  * Add support for Maruku's `fenced_code_blocks` option (#1799)
  * Update Redcarpet dependency to ~> 3.0 (#1815)
  * Automatically sort all pages by name (#1848)
  * Better error message when time is not parseable (#1847)
  * Allow `include` tag variable arguments to use filters (#1841)
  * `post_url` tag should raise `ArgumentError` for invalid name (#1825)
  * Bump dependency `mercenary` to `~> 0.2.0` (#1879)
  * Bump dependency `safe_yaml` to `~> 1.0` (#1886)
  * Allow sorting of content by custom properties (#1849)
  * Add `--quiet` flag to silence output during build and serve (#1898)
  * Add a `where` filter to filter arrays based on a key/value pair (#1875)
  * Route 404 errors to a custom 404 page in development (#1899)
  * Excludes are now relative to the site source (#1916)
  * Bring MIME Types file for `jekyll serve` to complete parity with GH Pages servers (#1993)
  * Adding Breakpoint to make new site template more responsive (#2038)
  * Default to using the UTF-8 encoding when reading files. (#2031)
  * Update Redcarpet dependency to ~> 3.1 (#2044)
  * Remove support for Ruby 1.9.2 (#2045)
  * Add `.mkdown` as valid Markdown extension (#2048)
  * Add `index.xml` to the list of WEBrick directory index files (#2041)
  * Make the `layouts` config key relative to CWD or to source (#2058)
  * Update Kramdown to `~> 1.3` (#1894)
  * Remove unnecessary references to `self` (#2090)
  * Update to Mercenary v0.3.x (#2085)
  * Ship Sass support as a separate gem (#2098)
  * Extract core extensions into a Utils module (#2112)
  * Refactor CLI & Commands For Greater Happiness (#2143)
  * Provide useful error when Pygments returns `nil` and error out (#2148)
  * Add support for unpublished drafts (#2164)
  * Add `force_polling` option to the `serve` command (#2165)
  * Clean up the `<head>` in the site template (#2186)
  * Permit YAML blocks to end with three dots to better conform with the YAML spec (#2110)
  * Use `File.exist?` instead of deprecated `File.exists?` (#2214)
  * Require newline after start of YAML Front Matter header (#2211)
  * Add the ability for pages to be marked as `published: false` (#1492)
  * Add `Jekyll::LiquidExtensions` with `.lookup_variable` method for easy looking up of variable values in a Liquid context. (#2253)
  * Remove literal lang name from class (#2292)
  * Return `utf-8` encoding in header for webrick error page response (#2289)
  * Make template site easier to customize (#2268)
  * Add two-digit year to permalink template option (#2301)
  * Add `site.documents` to Liquid payload (list of all docs) (#2295)
  * Take into account missing values in the Liquid sort filter (#2299)

### Bug Fixes

  * Don't allow nil entries when loading posts (#1796)
  * Remove the scrollbar that's always displayed in new sites generated from the site template (#1805)
  * Add `#path` to required methods in `Jekyll::Convertible` (#1866)
  * Default Maruku fenced code blocks to ON for 2.0.0-dev (#1831)
  * Change short opts for host and port for `jekyll docs` to be consistent with other subcommands (#1877)
  * Fix typos (#1910)
  * Lock Maruku at 0.7.0 to prevent bugs caused by Maruku 0.7.1 (#1958)
  * Fixes full path leak to source directory when using include tag (#1951)
  * Don't generate pages that aren't being published (#1931)
  * Use `SafeYAML.load` to avoid conflicts with other projects (#1982)
  * Relative posts should never fail to build (#1976)
  * Remove executable bits of non executable files (#2056)
  * `#path` for a draft is now `_drafts` instead of `_posts` (#2042)
  * Patch a couple show-stopping security vulnerabilities (#1946)
  * Sanitize paths uniformly, in a Windows-friendly way (#2065, #2109)
  * Update gem build steps to work correctly on Windows (#2118)
  * Remove obsolete `normalize_options` method call from `bin/jekyll` (#2121)
  * Remove `+` characters from Pygments lexer names when adding as a CSS class (#994)
  * Remove some code that caused Ruby interpreter warnings (#2178)
  * Only strip the drive name if it begins the string (#2175)
  * Remove default post with invalid date from site template (#2200)
  * Fix `Post#url` and `Page#url` escape (#1568)
  * Strip newlines from the `{% highlight %}` block content (#1823)
  * Load in `rouge` only when it's been requested as the highlighter (#2189)
  * Convert input to string before XML escaping (`xml_escape` liquid filter) (#2244)
  * Modify configuration key for Collections and reset properly. (#2238)
  * Avoid duplicated output using `highlight` tag (#2264)
  * Only use Jekyll.logger for output (#2307)
  * Close the file descriptor in `has_yaml_header?` (#2310)
  * Add `output` to `Document` liquid output hash (#2309)

### Development Fixes

  * Add a link to the site in the README.md file (#1795)
  * Add in History and site changes from `v1-stable` branch (#1836)
  * Testing additions on the Excerpt class (#1893)
  * Fix the `highlight` tag feature (#1859)
  * Test Jekyll under Ruby 2.1.0 (#1900)
  * Add script/cibuild for fun and profit (#1912)
  * Use `Forwardable` for delegation between `Excerpt` and `Post` (#1927)
  * Rename `read_things` to `read_content` (#1928)
  * Add `script/branding` script for ASCII art lovin' (#1936)
  * Update the README to reflect the repo move (#1943)
  * Add the project vision to the README (#1935)
  * Speed up Travis CI builds by using Rebund (#1985)
  * Use Yarp as a Gem proxy for Travis CI (#1984)
  * Remove Yarp as a Gem proxy for Travis CI (#2004)
  * Move the reading of layouts into its own class (#2020)
  * Test Sass import (#2009)
  * Switch Maruku and Kramdown in lists of Runtime vs. Development dependencies (#2049)
  * Clean up the gemspec for the project (#2095)
  * Add Japanese translation of README and CONTRIBUTING docs. (#2081)
  * Re-align the tables in Cucumber (#2108)
  * Trim trailing spaces and convert tabs to spaces (#2122)
  * Fix the failing Travis scenarios due to Cucumber issues (#2155)
  * Wrap `bundle install` in `travis_retry` to retry when RubyGems fails (#2160)
  * Refactor tags and categories (#1639)
  * Extract plugin management into its own class (#2197)
  * Add missing tests for `Command` (#2216)
  * Update `rr` link in CONTRIBUTING doc (#2247)
  * Streamline Cucumber execution of `jekyll` subcommands (#2258)
  * Refactor `Commands::Serve`. (#2269)
  * Refactor `highlight` tag (#2154)
  * Update `Util` hash functions with latest from Rails (#2273)
  * Workaround for Travis bug (#2290)

### Site Enhancements

  * Document Kramdown's GFM parser option (#1791)
  * Move CSS to includes & update normalize.css to v2.1.3 (#1787)
  * Minify CSS only in production (#1803)
  * Fix broken link to installation of Ruby on Mountain Lion blog post on Troubleshooting docs page (#1797)
  * Fix issues with 1.4.1 release blog post (#1804)
  * Add note about deploying to OpenShift (#1812)
  * Collect all Windows-related docs onto one page (#1818)
  * Fixed typo in datafiles doc page (#1854)
  * Clarify how to access `site` in docs (#1864)
  * Add closing `<code>` tag to `context.registers[:site]` note (#1867)
  * Fix link to @mojombo's site source (#1897)
  * Add `paginate: nil` to default configuration in docs (#1896)
  * Add link to our License in the site footer (#1889)
  * Add a charset note in "Writing Posts" doc page (#1902)
  * Disallow selection of path and prompt in bash examples
  * Add jekyll-compass to the plugin list (#1923)
  * Add note in Posts docs about stripping `<p>` tags from excerpt (#1933)
  * Add additional info about the new exclude behavior (#1938)
  * Linkify 'awesome contributors' to point to the contributors graph on GitHub (#1940)
  * Update `docs/sites.md` link to GitHub Training materials (#1949)
  * Update `master` with the release info from 1.4.3 (#1947)
  * Define docs nav in datafile (#1953)
  * Clarify the docs around the naming convention for posts (#1971)
  * Add missing `next` and `previous` docs for post layouts and templates (#1970)
  * Add note to `Writing posts` page about how to strip html from excerpt (#1962)
  * Add `jekyll-humanize` plugin to plugin list (#1998)
  * Add `jekyll-font-awesome` plugin to plugin list (#1999)
  * Add `sublime-jekyll` to list of Editor plugins (#2001)
  * Add `vim-jekyll` to the list of Editor plugins (#2005)
  * Fix non-semantic nesting of `p` tags in `news_item` layout (#2013)
  * Document destination folder cleaning (#2016)
  * Updated instructions for NearlyFreeSpeech.NET installation (#2015)
  * Update link to rack-jekyll on "Deployment Methods" page (#2047)
  * Fix typo in /docs/configuration (#2073)
  * Fix count in docs for `site.static_files` (#2077)
  * Update configuration docs to indicate utf-8 is the default for 2.0.0 and ASCII for 1.9.3 (#2074)
  * Add info about unreleased feature to the site (#2061)
  * Add whitespace to liquid example in GitHub Pages docs (#2084)
  * Clarify the way Sass and CoffeeScript files are read in and output (#2067)
  * Add lyche gallery tag plugin link to list of plugins (#2094)
  * Add Jekyll Pages Directory plugin to list of plugins (#2096)
  * Update Configuration docs page with new markdown extension (#2102)
  * Add `jekyll-image-set` to the list of third-party plugins (#2105)
  * Losslessly compress images (#2128)
  * Update normalize.css to 3.0.0 (#2126)
  * Update modernizr to v2.7.1 (#2129)
  * Add `jekyll-ordinal` to list of third-party plugins (#2150)
  * Add `jekyll_figure` to list of third-party plugins (#2158)
  * Clarify the documentation for safe mode (#2163)
  * Some HTML tidying (#2130)
  * Remove modernizr and use html5shiv.js directly for IE less than v9 (#2131)
  * Remove unused images (#2187)
  * Use `array_to_sentence_string` filter when outputting news item categories (#2191)
  * Add link to Help repo in primary navigation bar (#2177)
  * Switch to using an ico file for the shortcut icon (#2193)
  * Use numbers to specify font weights and only bring in font weights used (#2185)
  * Add a link to the list of all tz database time zones (#1824)
  * Clean-up and improve documentation `feed.xml` (#2192)
  * Remove duplicate entry in list of third-party plugins (#2206)
  * Reduce the whitespace in the favicon. (#2213)
  * Add `jekyll-page-collections` to list of third-party plugins (#2215)
  * Add a cross-reference about `post_url` (#2243)
  * Add `jekyll-live-tiles` to list of third-party plugins (#2250)
  * Fixed broken link to GitHub training material site source (#2257)
  * Update link to help repo, now called `jekyll-help` (#2277)
  * Fix capitalization of 'Jekyll' on Deployment Methods page (#2291)
  * Include plugins by sonnym in list of third-party plugins (#2297)
  * Add deprecated articles keeper filter to list of third-party plugins (#2300)
  * Simplify and improve our CSS. (#2127)
  * Use black text color for the mobile navbar (#2306)
  * Use the built in date filter and `site.time` for the copyright year. (#2305)
  * Update html5shiv to v3.7.2 (#2304)
  * Add 2.0.0 release post (#2298)
  * Add docs for custom markdown processors (#2298)
  * Add docs for `where` and `group_by` Liquid filters (#2298)
  * Remove notes in docs for unreleased features (#2309)

## 1.5.1 / 2014-03-27

### Bug Fixes

  * Only strip the drive name if it begins the string (#2176)

## 1.5.0 / 2014-03-24

### Minor Enhancements

  * Loosen `safe_yaml` dependency to `~> 1.0` (#2167)
  * Bump `safe_yaml` dependency to `~> 1.0.0` (#1942)

### Bug Fixes

  * Fix issue where filesystem traversal restriction broke Windows (#2167)
  * Lock `maruku` at `0.7.0` (#2167)

### Development Fixes

  * Lock `cucumber` at `1.3.11` (#2167)

## 1.4.3 / 2014-01-13

### Bug Fixes

  * Patch show-stopping security vulnerabilities (#1944)

## 1.4.2 / 2013-12-16

### Bug Fixes

  * Turn on Maruku fenced code blocks by default (#1830)

## 1.4.1 / 2013-12-09

### Bug Fixes

  * Don't allow nil entries when loading posts (#1796)

## 1.4.0 / 2013-12-07

### Major Enhancements

  * Add support for TOML config files (#1765)

### Minor Enhancements

  * Sort plugins as a way to establish a load order (#1682)
  * Update Maruku to 0.7.0 (#1775)

### Bug Fixes

  * Add a space between two words in a Pagination warning message (#1769)
  * Upgrade `toml` gem to `v0.1.0` to maintain compat with Ruby 1.8.7 (#1778)

### Development Fixes

  * Remove some whitespace in the code (#1755)
  * Remove some duplication in the reading of posts and drafts (#1779)

### Site Enhancements

  * Fixed case of a word in the Jekyll v1.3.0 release post (#1762)
  * Fixed the mime type for the favicon (#1772)

## 1.3.1 / 2013-11-26

### Minor Enhancements

  * Add a `--prefix` option to passthrough for the importers (#1669)
  * Push the paginator plugin lower in the plugin priority order so other plugins run before it (#1759)

### Bug Fixes

  * Fix the include tag when ran in a loop (#1726)
  * Fix errors when using `--watch` on 1.8.7 (#1730)
  * Specify where the include is called from if an included file is missing (#1746)

### Development Fixes

  * Extract `Site#filter_entries` into its own object (#1697)
  * Enable Travis' bundle caching (#1734)
  * Remove trailing whitespace in some files (#1736)
  * Fix a duplicate test name (#1754)

### Site Enhancements

  * Update link to example Rakefile to point to specific commit (#1741)
  * Fix drafts docs to indicate that draft time is based on file modification time, not `Time.now` (#1695)
  * Add `jekyll-monthly-archive-plugin` and `jekyll-category-archive-plugin` to list of third-party plugins (#1693)
  * Add `jekyll-asset-path-plugin` to list of third-party plugins (#1670)
  * Add `emoji-for-jekyll` to list of third-part plugins (#1708)
  * Fix previous section link on plugins page to point to pagination page (#1707)
  * Add `org-mode` converter plugin to third-party plugins (#1711)
  * Point "Blog migrations" page to http://import.jekyllrb.com (#1732)
  * Add docs for `post_url` when posts are in subdirectories (#1718)
  * Update the docs to point to `example.com` (#1448)

## 1.3.0 / 2013-11-04

### Major Enhancements

  * Add support for adding data as YAML files under a site's `_data` directory (#1003)
  * Allow variables to be used with `include` tags (#1495)
  * Allow using gems for plugin management (#1557)

### Minor Enhancements

  * Decrease the specificity in the site template CSS (#1574)
  * Add `encoding` configuration option (#1449)
  * Provide better error handling for Jekyll's custom Liquid tags (#1514)
  * If an included file causes a Liquid error, add the path to the include file that caused the error to the error message (#1596)
  * If a layout causes a Liquid error, change the error message so that we know it comes from the layout (#1601)
  * Update Kramdown dependency to `~> 1.2` (#1610)
  * Update `safe_yaml` dependency to `~> 0.9.7` (#1602)
  * Allow layouts to be in subfolders like includes (#1622)
  * Switch to listen for site watching while serving (#1589)
  * Add a `json` liquid filter to be used in sites (#1651)
  * Point people to the migration docs when the `jekyll-import` gem is missing (#1662)

### Bug Fixes

  * Fix up matching against source and destination when the two locations are similar (#1556)
  * Fix the missing `pathname` require in certain cases (#1255)
  * Use `+` instead of `Array#concat` when building `Post` attribute list (#1571)
  * Print server address when launching a server (#1586)
  * Downgrade to Maruku `~> 0.6.0` in order to avoid changes in rendering (#1598)
  * Fix error with failing include tag when variable was file name (#1613)
  * Downcase lexers before passing them to pygments (#1615)
  * Capitalize the short verbose switch because it conflicts with the built-in Commander switch (#1660)
  * Fix compatibility with 1.8.x (#1665)
  * Fix an error with the new file watching code due to library version incompatibilities (#1687)

### Development Fixes

  * Add coverage reporting with Coveralls (#1539)
  * Refactor the Liquid `include` tag (#1490)
  * Update launchy dependency to `~> 2.3` (#1608)
  * Update rr dependency to `~> 1.1` (#1604)
  * Update cucumber dependency to `~> 1.3` (#1607)
  * Update coveralls dependency to `~> 0.7.0` (#1606)
  * Update rake dependency to `~> 10.1` (#1603)
  * Clean up `site.rb` comments to be more concise/uniform (#1616)
  * Use the master branch for the build badge in the readme (#1636)
  * Refactor Site#render (#1638)
  * Remove duplication in command line options (#1637)
  * Add tests for all the coderay options (#1543)
  * Improve some of the Cucumber test code (#1493)
  * Improve comparisons of timestamps by ignoring the seconds (#1582)

### Site Enhancements

  * Fix params for `JekyllImport::WordPress.process` arguments (#1554)
  * Add `jekyll-suggested-tweet` to list of third-party plugins (#1555)
  * Link to Liquid's docs for tags and filters (#1553)
  * Add note about installing Xcode on the Mac in the Installation docs (#1561)
  * Simplify/generalize pagination docs (#1577)
  * Add documentation for the new data sources feature (#1503)
  * Add more information on how to create generators (#1590, #1592)
  * Improve the instructions for mimicking GitHub Flavored Markdown (#1614)
  * Add `jekyll-import` warning note of missing dependencies (#1626)
  * Fix grammar in the Usage section (#1635)
  * Add documentation for the use of gems as plugins (#1656)
  * Document the existence of a few additional plugins (#1405)
  * Document that the `date_to_string` always returns a two digit day (#1663)
  * Fix navigation in the "Working with Drafts" page (#1667)
  * Fix an error with the data documentation (#1691)

## 1.2.1 / 2013-09-14

### Minor Enhancements

  * Print better messages for detached server. Mute output on detach. (#1518)
  * Disable reverse lookup when running `jekyll serve` (#1363)
  * Upgrade RedCarpet dependency to `~> 2.3.0` (#1515)
  * Upgrade to Liquid `>= 2.5.2, < 2.6` (#1536)

### Bug Fixes

  * Fix file discrepancy in gemspec (#1522)
  * Force rendering of Include tag (#1525)

### Development Fixes

  * Add a rake task to generate a new release post (#1404)
  * Mute LSI output in tests (#1531)
  * Update contributor documentation (#1537)

### Site Enhancements

  * Fix a couple of validation errors on the site (#1511)
  * Make navigation menus reusable (#1507)
  * Fix link to History page from Release v1.2.0 notes post.
  * Fix markup in History file for command line options (#1512)
  * Expand 1.2 release post title to 1.2.0 (#1516)

## 1.2.0 / 2013-09-06

### Major Enhancements

  * Disable automatically-generated excerpts when `excerpt_separator` is `""`. (#1386)
  * Add checking for URL conflicts when running `jekyll doctor` (#1389)

### Minor Enhancements

  * Catch and fix invalid `paginate` values (#1390)
  * Remove superfluous `div.container` from the default html template for `jekyll new` (#1315)
  * Add `-D` short-form switch for the drafts option (#1394)
  * Update the links in the site template for Twitter and GitHub (#1400)
  * Update dummy email address to example.com domain (#1408)
  * Update normalize.css to v2.1.2 and minify; add rake task to update normalize.css with greater ease. (#1430)
  * Add the ability to detach the server ran by `jekyll serve` from it's controlling terminal (#1443)
  * Improve permalink generation for URLs with special characters (#944)
  * Expose the current Jekyll version to posts and pages via a new `jekyll.version` variable (#1481)

### Bug Fixes

  * Markdown extension matching matches only exact matches (#1382)
  * Fixed NoMethodError when message passed to `Stevenson#message` is nil (#1388)
  * Use binary mode when writing file (#1364)
  * Fix 'undefined method `encoding` for "mailto"' errors w/ Ruby 1.8 and Kramdown > 0.14.0 (#1397)
  * Do not force the permalink to be a dir if it ends on .html (#963)
  * When a Liquid Exception is caught, show the full path rel. to site source (#1415)
  * Properly read in the config options when serving the docs locally (#1444)
  * Fixed `--layouts` option for `build` and `serve` commands (#1458)
  * Remove kramdown as a runtime dependency since it's optional (#1498)
  * Provide proper error handling for invalid file names in the include tag (#1494)

### Development Fixes

  * Remove redundant argument to Jekyll::Commands::New#scaffold_post_content (#1356)
  * Add new dependencies to the README (#1360)
  * Fix link to contributing page in README (#1424)
  * Update TomDoc in Pager#initialize to match params (#1441)
  * Refactor `Site#cleanup` into `Jekyll::Site::Cleaner` class (#1429)
  * Several other small minor refactorings (#1341)
  * Ignore `_site` in jekyllrb.com deploy (#1480)
  * Add Gem version and dependency badge to README (#1497)

### Site Enhancements

  * Add info about new releases (#1353)
  * Update plugin list with jekyll-rss plugin (#1354)
  * Update the site list page with Ruby's official site (#1358)
  * Add `jekyll-ditaa` to list of third-party plugins (#1370)
  * Add `postfiles` to list of third-party plugins (#1373)
  * For internal links, use full path including trailing `/` (#1411)
  * Use curly apostrophes in the docs (#1419)
  * Update the docs for Redcarpet in Jekyll (#1418)
  * Add `pluralize` and `reading_time` filters to docs (#1439)
  * Fix markup for the Kramdown options (#1445)
  * Fix typos in the History file (#1454)
  * Add trailing slash to site's post URL (#1462)
  * Clarify that `--config` will take multiple files (#1474)
  * Fix docs/templates.md private gist example (#1477)
  * Use `site.repository` for Jekyll's GitHub URL (#1463)
  * Add `jekyll-pageless-redirects` to list of third-party plugins (#1486)
  * Clarify that `date_to_xmlschema` returns an ISO 8601 string (#1488)
  * Add `jekyll-good-include` to list of third-party plugins (#1491)
  * XML escape the blog post title in our feed (#1501)
  * Add `jekyll-toc-generator` to list of third-party plugins (#1506)

## 1.1.2 / 2013-07-25

### Bug Fixes

  * Require Liquid 2.5.1 (#1349)

## 1.1.1 / 2013-07-24

### Minor Enhancements

  * Remove superfluous `table` selector from main.css in `jekyll new` template (#1328)
  * Abort with non-zero exit codes (#1338)

### Bug Fixes

  * Fix up the rendering of excerpts (#1339)

### Site Enhancements

  * Add Jekyll Image Tag to the plugins list (#1306)
  * Remove erroneous statement that `site.pages` are sorted alphabetically.
  * Add info about the `_drafts` directory to the directory structure docs (#1320)
  * Improve the layout of the plugin listing by organizing it into categories (#1310)
  * Add generator-jekyllrb and grunt-jekyll to plugins page (#1330)
  * Mention Kramdown as option for markdown parser on Extras page (#1318)
  * Update Quick-Start page to include reminder that all requirements must be installed (#1327)
  * Change filename in `include` example to an HTML file so as not to indicate that Jekyll will automatically convert them. (#1303)
  * Add an RSS feed for commits to Jekyll (#1343)

## 1.1.0 / 2013-07-14

### Major Enhancements

  * Add `docs` subcommand to read Jekyll's docs when offline. (#1046)
  * Support passing parameters to templates in `include` tag (#1204)
  * Add support for Liquid tags to post excerpts (#1302)

### Minor Enhancements

  * Search the hierarchy of pagination path up to site root to determine template page for pagination. (#1198)
  * Add the ability to generate a new Jekyll site without a template (#1171)
  * Use redcarpet as the default markdown engine in newly generated sites (#1245, #1247)
  * Add `redcarpet` as a runtime dependency so `jekyll build` works out-of-the-box for new sites. (#1247)
  * In the generated site, remove files that will be replaced by a directory (#1118)
  * Fail loudly if a user-specified configuration file doesn't exist (#1098)
  * Allow for all options for Kramdown HTML Converter (#1201)

### Bug Fixes

  * Fix pagination in subdirectories. (#1198)
  * Fix an issue with directories and permalinks that have a plus sign (+) in them (#1215)
  * Provide better error reporting when generating sites (#1253)
  * Latest posts first in non-LSI `related_posts` (#1271)

### Development Fixes

  * Merge the theme and layout Cucumber steps into one step (#1151)
  * Restrict activesupport dependency to pre-4.0.0 to maintain compatibility with `<= 1.9.2`
  * Include/exclude deprecation handling simplification (#1284)
  * Convert README to Markdown. (#1267)
  * Refactor Jekyll::Site (#1144)

### Site Enhancements

  * Add "News" section for release notes, along with an RSS feed (#1093, #1285, #1286)
  * Add "History" page.
  * Restructured docs sections to include "Meta" section.
  * Add message to "Templates" page that specifies that Python must be installed in order to use Pygments. (#1182)
  * Update link to the official Maruku repo (#1175)
  * Add documentation about `paginate_path` to "Templates" page in docs (#1129)
  * Give the quick-start guide its own page (#1191)
  * Update ProTip on Installation page in docs to point to all the info about Pygments and the 'highlight' tag. (#1196)
  * Run `site/img` through ImageOptim (thanks @qrush!) (#1208)
  * Added Jade Converter to `site/docs/plugins` (#1210)
  * Fix location of docs pages in Contributing pages (#1214)
  * Add ReadInXMinutes plugin to the plugin list (#1222)
  * Remove plugins from the plugin list that have equivalents in Jekyll proper (#1223)
  * Add jekyll-assets to the plugin list (#1225)
  * Add jekyll-pandoc-mulitple-formats to the plugin list (#1229)
  * Remove dead link to "Using Git to maintain your blog" (#1227)
  * Tidy up the third-party plugins listing (#1228)
  * Update contributor information (#1192)
  * Update URL of article about Blogger migration (#1242)
  * Specify that RedCarpet is the default for new Jekyll sites on Quickstart page (#1247)
  * Added `site.pages` to Variables page in docs (#1251)
  * Add Youku and Tudou Embed link on Plugins page. (#1250)
  * Add note that `gist` tag supports private gists. (#1248)
  * Add `jekyll-timeago` to list of third-party plugins. (#1260)
  * Add `jekyll-swfobject` to list of third-party plugins. (#1263)
  * Add `jekyll-picture-tag` to list of third-party plugins. (#1280)
  * Update the GitHub Pages documentation regarding relative URLs (#1291)
  * Update the S3 deployment documentation (#1294)
  * Add suggestion for Xcode CLT install to troubleshooting page in docs (#1296)
  * Add 'Working with drafts' page to docs (#1289)
  * Add information about time zones to the documentation for a page's date (#1304)

## 1.0.3 / 2013-06-07

### Minor Enhancements

  * Add support to gist tag for private gists. (#1189)
  * Fail loudly when Maruku errors out (#1190)
  * Move the building of related posts into their own class (#1057)
  * Removed trailing spaces in several places throughout the code (#1116)
  * Add a `--force` option to `jekyll new` (#1115)
  * Convert IDs in the site template to classes (#1170)

### Bug Fixes

  * Fix typo in Stevenson constant "ERROR". (#1166)
  * Rename Jekyll::Logger to Jekyll::Stevenson to fix inheritance issue (#1106)
  * Exit with a non-zero exit code when dealing with a Liquid error (#1121)
  * Make the `exclude` and `include` options backwards compatible with versions of Jekyll prior to 1.0 (#1114)
  * Fix pagination on Windows (#1063)
  * Fix the application of Pygments' Generic Output style to Go code (#1156)

### Site Enhancements

  * Add a Pro Tip to docs about front matter variables being optional (#1147)
  * Add changelog to site as History page in /docs/ (#1065)
  * Add note to Upgrading page about new config options in 1.0.x (#1146)
  * Documentation for `date_to_rfc822` and `uri_escape` (#1142)
  * Documentation highlight boxes shouldn't show scrollbars if not necessary (#1123)
  * Add link to jekyll-minibundle in the doc's plugins list (#1035)
  * Quick patch for importers documentation
  * Fix prefix for WordpressDotCom importer in docs (#1107)
  * Add jekyll-contentblocks plugin to docs (#1068)
  * Make code bits in notes look more natural, more readable (#1089)
  * Fix logic for `relative_permalinks` instructions on Upgrading page (#1101)
  * Add docs for post excerpt (#1072)
  * Add docs for gist tag (#1072)
  * Add docs indicating that Pygments does not need to be installed separately (#1099, #1119)
  * Update the migrator docs to be current (#1136)
  * Add the Jekyll Gallery Plugin to the plugin list (#1143)

### Development Fixes

  * Use Jekyll.logger instead of Jekyll::Stevenson to log things (#1149)
  * Fix pesky Cucumber infinite loop (#1139)
  * Do not write posts with timezones in Cucumber tests (#1124)
  * Use ISO formatted dates in Cucumber features (#1150)

## 1.0.2 / 2013-05-12

### Major Enhancements

  * Add `jekyll doctor` command to check site for any known compatibility problems (#1081)
  * Backwards-compatibilize relative permalinks (#1081)

### Minor Enhancements

  * Add a `data-lang="<lang>"` attribute to Redcarpet code blocks (#1066)
  * Deprecate old config `server_port`, match to `port` if `port` isn't set (#1084)
  * Update pygments.rb version to 0.5.0 (#1061)
  * Update Kramdown version to 1.0.2 (#1067)

### Bug Fixes

  * Fix issue when categories are numbers (#1078)
  * Catching that Redcarpet gem isn't installed (#1059)

### Site Enhancements

  * Add documentation about `relative_permalinks` (#1081)
  * Remove pygments-installation instructions, as pygments.rb is bundled with it (#1079)
  * Move pages to be Pages for realz (#985)
  * Updated links to Liquid documentation (#1073)

## 1.0.1 / 2013-05-08

### Minor Enhancements

  * Do not force use of `toc_token` when using `generate_tok` in RDiscount (#1048)
  * Add newer `language-` class name prefix to code blocks (#1037)
  * Commander error message now preferred over process abort with incorrect args (#1040)

### Bug Fixes

  * Make Redcarpet respect the pygments configuration option (#1053)
  * Fix the index build with LSI (#1045)
  * Don't print deprecation warning when no arguments are specified. (#1041)
  * Add missing `</div>` to site template used by `new` subcommand, fixed typos in code (#1032)

### Site Enhancements

  * Changed https to http in the GitHub Pages link (#1051)
  * Remove CSS cruft, fix typos, fix HTML errors (#1028)
  * Removing manual install of Pip and Distribute (#1025)
  * Updated URL for Markdown references plugin (#1022)

### Development Fixes

  * Markdownify history file (#1027)
  * Update links on README to point to new jekyllrb.com (#1018)

## 1.0.0 / 2013-05-06

### Major Enhancements

  * Add `jekyll new` subcommand: generate a Jekyll scaffold (#764)
  * Refactored Jekyll commands into subcommands: build, serve, and migrate. (#690)
  * Removed importers/migrators from main project, migrated to jekyll-import sub-gem (#793)
  * Added ability to render drafts in `_drafts` folder via command line (#833)
  * Add ordinal date permalink style (/:categories/:year/:y_day/:title.html) (#928)

### Minor Enhancements

  * Site template HTML5-ified (#964)
  * Use post's directory path when matching for the `post_url` tag (#998)
  * Loosen dependency on Pygments so it's only required when it's needed (#1015)
  * Parse strings into Time objects for date-related Liquid filters (#1014)
  * Tell the user if there is no subcommand specified (#1008)
  * Freak out if the destination of `jekyll new` exists and is non-empty (#981)
  * Add `timezone` configuration option for compilation (#957)
  * Add deprecation messages for pre-1.0 CLI options (#959)
  * Refactor and colorize logging (#959)
  * Refactor Markdown parsing (#955)
  * Added application/vnd.apple.pkpass to mime.types served by WEBrick (#907)
  * Move template site to default markdown renderer (#961)
  * Expose new attribute to Liquid via `page`: `page.path` (#951)
  * Accept multiple config files from command line (#945)
  * Add page variable to liquid custom tags and blocks (#413)
  * Add `paginator.previous_page_path` and `paginator.next_page_path` (#942)
  * Backwards compatibility for 'auto' (#821, #934)
  * Added date_to_rfc822 used on RSS feeds (#892)
  * Upgrade version of pygments.rb to 0.4.2 (#927)
  * Added short month (e.g. "Sep") to permalink style options for posts (#890)
  * Expose site.baseurl to Liquid templates (#869)
  * Adds excerpt attribute to posts which contains first paragraph of content (#837)
  * Accept custom configuration file via CLI (#863)
  * Load in GitHub Pages MIME Types on `jekyll serve` (#847, #871)
  * Improve debugability of error message for a malformed highlight tag (#785)
  * Allow symlinked files in unsafe mode (#824)
  * Add 'gist' Liquid tag to core (#822, #861)
  * New format of Jekyll output (#795)
  * Reinstate `--limit_posts` and `--future` switches (#788)
  * Remove ambiguity from command descriptions (#815)
  * Fix SafeYAML Warnings (#807)
  * Relaxed Kramdown version to 0.14 (#808)
  * Aliased `jekyll server` to `jekyll serve`. (#792)
  * Updated gem versions for Kramdown, Rake, Shoulda, Cucumber, and RedCarpet. (#744)
  * Refactored Jekyll subcommands into Jekyll::Commands submodule, which now contains them (#768)
  * Rescue from import errors in Wordpress.com migrator (#671)
  * Massively accelerate LSI performance (#664)
  * Truncate post slugs when importing from Tumblr (#496)
  * Add glob support to include, exclude option (#743)
  * Layout of Page or Post defaults to 'page' or 'post', respectively (#580) REPEALED by (#977)
  * "Keep files" feature (#685)
  * Output full path & name for files that don't parse (#745)
  * Add source and destination directory protection (#535)
  * Better YAML error message (#718)
  * Bug Fixes
  * Paginate in subdirectories properly (#1016)
  * Ensure post and page URLs have a leading slash (#992)
  * Catch all exceptions, not just StandardError descendents (#1007)
  * Bullet-proof `limit_posts` option (#1004)
  * Read in YAML as UTF-8 to accept non-ASCII chars (#836)
  * Fix the CLI option `--plugins` to actually accept dirs and files (#993)
  * Allow 'excerpt' in YAML front matter to override the extracted excerpt (#946)
  * Fix cascade problem with site.baseurl, site.port and site.host. (#935)
  * Filter out directories with valid post names (#875)
  * Fix symlinked static files not being correctly built in unsafe mode (#909)
  * Fix integration with directory_watcher 1.4.x (#916)
  * Accepting strings as arguments to jekyll-import command (#910)
  * Force usage of older directory_watcher gem as 1.5 is broken (#883)
  * Ensure all Post categories are downcase (#842, #872)
  * Force encoding of the rdiscount TOC to UTF8 to avoid conversion errors (#555)
  * Patch for multibyte URI problem with `jekyll serve` (#723)
  * Order plugin execution by priority (#864)
  * Fixed Page#dir and Page#url for edge cases (#536)
  * Fix broken `post_url` with posts with a time in their YAML front matter (#831)
  * Look for plugins under the source directory (#654)
  * Tumblr Migrator: finds `_posts` dir correctly, fixes truncation of long post names (#775)
  * Force Categories to be Strings (#767)
  * Safe YAML plugin to prevent vulnerability (#777)
  * Add SVG support to Jekyll/WEBrick. (#407, #406)
  * Prevent custom destination from causing continuous regen on watch (#528, #820, #862)

### Site Enhancements

  * Responsify (#860)
  * Fix spelling, punctuation and phrasal errors (#989)
  * Update quickstart instructions with `new` command (#966)
  * Add docs for page.excerpt (#956)
  * Add docs for page.path (#951)
  * Clean up site docs to prepare for 1.0 release (#918)
  * Bring site into master branch with better preview/deploy (#709)
  * Redesigned site (#583)

### Development Fixes

  * Exclude Cucumber 1.2.4, which causes tests to fail in 1.9.2 (#938)
  * Added "features:html" rake task for debugging purposes, cleaned up Cucumber profiles (#832)
  * Explicitly require HTTPS rubygems source in Gemfile (#826)
  * Changed Ruby version for development to 1.9.3-p374 from p362 (#801)
  * Including a link to the GitHub Ruby style guide in CONTRIBUTING.md (#806)
  * Added script/bootstrap (#776)
  * Running Simplecov under 2 conditions: ENV(COVERAGE)=true and with Ruby version of greater than 1.9 (#771)
  * Switch to Simplecov for coverage report (#765)

## 0.12.1 / 2013-02-19

### Minor Enhancements

  * Update Kramdown version to 0.14.1 (#744)
  * Test Enhancements
  * Update Rake version to 10.0.3 (#744)
  * Update Shoulda version to 3.3.2 (#744)
  * Update Redcarpet version to 2.2.2 (#744)

## 0.12.0 / 2012-12-22

### Minor Enhancements

  * Add ability to explicitly specify included files (#261)
  * Add `--default-mimetype` option (#279)
  * Allow setting of RedCloth options (#284)
  * Add `post_url` Liquid tag for internal post linking (#369)
  * Allow multiple plugin dirs to be specified (#438)
  * Inline TOC token support for RDiscount (#333)
  * Add the option to specify the paginated url format (#342)
  * Swap out albino for pygments.rb (#569)
  * Support Redcarpet 2 and fenced code blocks (#619)
  * Better reporting of Liquid errors (#624)
  * Bug Fixes
  * Allow some special characters in highlight names
  * URL escape category names in URL generation (#360)
  * Fix error with `limit_posts` (#442)
  * Properly select dotfile during directory scan (#363, #431, #377)
  * Allow setting of Kramdown `smart_quotes` (#482)
  * Ensure front matter is at start of file (#562)

## 0.11.2 / 2011-12-27

  * Bug Fixes
  * Fix gemspec

## 0.11.1 / 2011-12-27

  * Bug Fixes
  * Fix extra blank line in highlight blocks (#409)
  * Update dependencies

## 0.11.0 / 2011-07-10

### Major Enhancements

  * Add command line importer functionality (#253)
  * Add Redcarpet Markdown support (#318)
  * Make markdown/textile extensions configurable (#312)
  * Add `markdownify` filter

### Minor Enhancements

  * Switch to Albino gem
  * Bundler support
  * Use English library to avoid hoops (#292)
  * Add Posterous importer (#254)
  * Fixes for Wordpress importer (#274, #252, #271)
  * Better error message for invalid post date (#291)
  * Print formatted fatal exceptions to stdout on build failure
  * Add Tumblr importer (#323)
  * Add Enki importer (#320)
  * Bug Fixes
  * Secure additional path exploits

## 0.10.0 / 2010-12-16

  * Bug Fixes
  * Add `--no-server` option.

## 0.9.0 / 2010-12-15

### Minor Enhancements

  * Use OptionParser's `[no-]` functionality for better boolean parsing.
  * Add Drupal migrator (#245)
  * Complain about YAML and Liquid errors (#249)
  * Remove orphaned files during regeneration (#247)
  * Add Marley migrator (#28)

## 0.8.0 / 2010-11-22

### Minor Enhancements

  * Add wordpress.com importer (#207)
  * Add `--limit-posts` cli option (#212)
  * Add `uri_escape` filter (#234)
  * Add `--base-url` cli option (#235)
  * Improve MT migrator (#238)
  * Add kramdown support (#239)
  * Bug Fixes
  * Fixed filename basename generation (#208)
  * Set mode to UTF8 on Sequel connections (#237)
  * Prevent `_includes` dir from being a symlink

## 0.7.0 / 2010-08-24

### Minor Enhancements

  * Add support for rdiscount extensions (#173)
  * Bug Fixes
  * Highlight should not be able to render local files
  * The site configuration may not always provide a 'time' setting (#184)

## 0.6.2 / 2010-06-25

  * Bug Fixes
  * Fix Rakefile 'release' task (tag pushing was missing origin)
  * Ensure that RedCloth is loaded when textilize filter is used (#183)
  * Expand source, destination, and plugin paths (#180)
  * Fix `page.url` to include full relative path (#181)

## 0.6.1 / 2010-06-24

  * Bug Fixes
  * Fix Markdown Pygments prefix and suffix (#178)

## 0.6.0 / 2010-06-23

### Major Enhancements

  * Proper plugin system (#19, #100)
  * Add safe mode so unsafe converters/generators can be added
  * Maruku is now the only processor dependency installed by default. Other processors will be lazy-loaded when necessary (and prompt the user to install them when necessary) (#57)

### Minor Enhancements

  * Inclusion/exclusion of future dated posts (#59)
  * Generation for a specific time (#59)
  * Allocate `site.time` on render not per site_payload invocation (#59)
  * Pages now present in the site payload and can be used through the `site.pages` and `site.html_pages` variables
  * Generate phase added to site#process and pagination is now a generator
  * Switch to RakeGem for build/test process
  * Only regenerate static files when they have changed (#142)
  * Allow arbitrary options to Pygments (#31)
  * Allow URL to be set via command line option (#147)
  * Bug Fixes
  * Render highlighted code for non markdown/textile pages (#116)
  * Fix highlighting on Ruby 1.9 (#65)
  * Fix extension munging when pretty permalinks are enabled (#64)
  * Stop sorting categories (#33)
  * Preserve generated attributes over front matter (#119)
  * Fix source directory binding using `Dir.pwd` (#75)

## 0.5.7 / 2010-01-12

### Minor Enhancements

  * Allow overriding of post date in the front matter (#62, #38)
  * Bug Fixes
  * Categories isn't always an array (#73)
  * Empty tags causes error in read_posts (#84)
  * Fix pagination to adhere to read/render/write paradigm
  * Test Enhancement
  * Cucumber features no longer use site.posts.first where a better alternative is available

## 0.5.6 / 2010-01-08

  * Bug Fixes
  * Require redcloth >= 4.2.1 in tests (#92)
  * Don't break on triple dashes in yaml front matter (#93)

### Minor Enhancements

  * Allow .mkd as markdown extension
  * Use $stdout/err instead of constants (#99)
  * Properly wrap code blocks (#91)
  * Add javascript mime type for webrick (#98)

## 0.5.5 / 2010-01-08

  * Bug Fixes
  * Fix pagination % 0 bug (#78)
  * Ensure all posts are processed first (#71)
  * After this point I will no longer be giving credit in the history; that is what the commit log is for.

## 0.5.4 / 2009-08-23

  * Bug Fixes
  * Do not allow symlinks (security vulnerability)

## 0.5.3 / 2009-07-14

  * Bug Fixes
  * Solving the permalink bug where non-html files wouldn't work (@jeffrydegrande)

## 0.5.2 / 2009-06-24

  * Enhancements
  * Added --paginate option to the executable along with a paginator object for the payload (@calavera)
  * Upgraded RedCloth to 4.2.1, which makes `<notextile>` tags work once again.
  * Configuration options set in config.yml are now available through the site payload (@vilcans)
  * Posts can now have an empty YAML front matter or none at all (@ bahuvrihi)
  * Bug Fixes
  * Fixing Ruby 1.9 issue that requires `#to_s` on the err object (@Chrononaut)
  * Fixes for pagination and ordering posts on the same day (@ujh)
  * Made pages respect permalinks style and permalinks in yml front matter (@eugenebolshakov)
  * Index.html file should always have index.html permalink (@eugenebolshakov)
  * Added trailing slash to pretty permalink style so Apache is happy (@eugenebolshakov)
  * Bad markdown processor in config fails sooner and with better message (@ gcnovus)
  * Allow CRLFs in yaml front matter (@juretta)
  * Added Date#xmlschema for Ruby versions < 1.9

## 0.5.1 / 2009-05-06

### Major Enhancements

  * Next/previous posts in site payload (@pantulis, @tomo)
  * Permalink templating system
  * Moved most of the README out to the GitHub wiki
  * Exclude option in configuration so specified files won't be brought over with generated site (@duritong)
  * Bug Fixes
  * Making sure config.yaml references are all gone, using only config.yml
  * Fixed syntax highlighting breaking for UTF-8 code (@henrik)
  * Worked around RDiscount bug that prevents Markdown from getting parsed after highlight (@henrik)
  * CGI escaped post titles (@Chrononaut)

## 0.5.0 / 2009-04-07

### Minor Enhancements

  * Ability to set post categories via YAML (@qrush)
  * Ability to set prevent a post from publishing via YAML (@qrush)
  * Add textilize filter (@willcodeforfoo)
  * Add 'pretty' permalink style for wordpress-like urls (@dysinger)
  * Made it possible to enter categories from YAML as an array (@Chrononaut)
  * Ignore Emacs autosave files (@Chrononaut)
  * Bug Fixes
  * Use block syntax of popen4 to ensure that subprocesses are properly disposed (@jqr)
  * Close open4 streams to prevent zombies (@rtomayko)
  * Only query required fields from the WP Database (@ariejan)
  * Prevent `_posts` from being copied to the destination directory (@bdimcheff)
  * Refactors
  * Factored the filtering code into a method (@Chrononaut)
  * Fix tests and convert to Shoulda (@qrush, @technicalpickles)
  * Add Cucumber acceptance test suite (@qrush, @technicalpickles)

## 0.4.1

### Minor Enhancements

  * Changed date format on wordpress converter (zeropadding) (@dysinger)
  * Bug Fixes
  * Add Jekyll binary as executable to gemspec (@dysinger)

## 0.4.0 / 2009-02-03

### Major Enhancements

  * Switch to Jeweler for packaging tasks

### Minor Enhancements

  * Type importer (@codeslinger)
  * `site.topics` accessor (@baz)
  * Add `array_to_sentence_string` filter (@mchung)
  * Add a converter for textpattern (@PerfectlyNormal)
  * Add a working Mephisto / MySQL converter (@ivey)
  * Allowing .htaccess files to be copied over into the generated site (@briandoll)
  * Add option to not put file date in permalink URL (@mreid)
  * Add line number capabilities to highlight blocks (@jcon)
  * Bug Fixes
  * Fix permalink behavior (@cavalle)
  * Fixed an issue with pygments, markdown, and newlines (@zpinter)
  * Ampersands need to be escaped (@pufuwozu, @ap)
  * Test and fix the site.categories hash (@zzot)
  * Fix site payload available to files (@matrix9180)

## 0.3.0 / 2008-12-24

### Major Enhancements

  * Added `--server` option to start a simple WEBrick server on destination directory (@johnreilly and @mchung)

### Minor Enhancements

  * Added post categories based on directories containing `_posts` (@mreid)
  * Added post topics based on directories underneath `_posts`
  * Added new date filter that shows the full month name (@mreid)
  * Merge Post's YAML front matter into its to_liquid payload (@remi)
  * Restrict includes to regular files underneath `_includes`
  * Bug Fixes
  * Change YAML delimiter matcher so as to not chew up 2nd level markdown headers (@mreid)
  * Fix bug that meant page data (such as the date) was not available in templates (@mreid)
  * Properly reject directories in `_layouts`

## 0.2.1 / 2008-12-15

  * Major Changes
  * Use Maruku (pure Ruby) for Markdown by default (@mreid)
  * Allow use of RDiscount with `--rdiscount` flag

### Minor Enhancements

  * Don't load directory_watcher unless it's needed (@pjhyett)

## 0.2.0 / 2008-12-14

  * Major Changes
  * related_posts is now found in `site.related_posts`

## 0.1.6 / 2008-12-13

  * Major Features
  * Include files in `_includes` with `{% include x.textile %}`

## 0.1.5 / 2008-12-12

### Major Enhancements

  * Code highlighting with Pygments if `--pygments` is specified
  * Disable true LSI by default, enable with `--lsi`

### Minor Enhancements

  * Output informative message if RDiscount is not available (@JackDanger)
  * Bug Fixes
  * Prevent Jekyll from picking up the output directory as a source (@JackDanger)
  * Skip `related_posts` when there is only one post (@JackDanger)

## 0.1.4 / 2008-12-08

  * Bug Fixes
  * DATA does not work properly with rubygems

## 0.1.3 / 2008-12-06

  * Major Features
  * Markdown support (@vanpelt)
  * Mephisto and CSV converters (@vanpelt)
  * Code hilighting (@vanpelt)
  * Autobuild
  * Bug Fixes
  * Accept both `\r\n` and `\n` in YAML header (@vanpelt)

## 0.1.2 / 2008-11-22

  * Major Features
  * Add a real "related posts" implementation using Classifier
  * Command Line Changes
  * Allow cli to be called with 0, 1, or 2 args intuiting dir paths if they are omitted

## 0.1.1 / 2008-11-22

  * Minor Additions
  * Posts now support introspectional data e.g. `{{ page.url }}`

## 0.1.0 / 2008-11-05

  * First release
  * Converts posts written in Textile
  * Converts regular site pages
  * Simple copy of binary files

## 0.0.0 / 2008-10-19

  * Birthday!
