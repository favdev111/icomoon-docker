Feature: Collections
  As a hacker who likes to structure content
  I want to be able to create collections of similar information
  And render them

  Scenario: Unrendered collection
    Given I have an "index.html" page that contains "Collections: {{ site.methods }}"
    And I have fixture collections
    And I have a "_methods/static-file.txt" file that contains "Static Content {{ site.title }}"
    And I have a configuration file with "collections" set to "['methods']"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    But the _site/methods directory should not exist
    And the "_site/methods/configuration.html" file should not exist
    And the "_site/methods/static-file.txt" file should not exist

  Scenario: Rendered collection
    Given I have an "index.html" page that contains "Collections: output => {{ site.collections[0].output }} label => {{ site.collections[0].label }}"
    And I have an "collection_metadata.html" page that contains "Methods metadata: {{ site.collections[0].foo }} {{ site.collections[0] }}"
    And I have fixture collections
    And I have a "_methods/static-file.txt" file that contains "Static Content {{ site.title }}"
    And I have a "_config.yml" file with content:
    """
    collections:
      methods:
        output: true
        foo:   bar
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Collections: output => true" in "_site/index.html"
    And I should see "label => methods" in "_site/index.html"
    And I should see "Methods metadata: bar" in "_site/collection_metadata.html"
    And I should see "<p>Whatever: foo.bar</p>" in "_site/methods/configuration.html"
    And I should see "Static Content {{ site.title }}" in "_site/methods/static-file.txt"

  Scenario: Rendered collection at a custom URL
    Given I have an "index.html" page that contains "Collections: {{ site.collections }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
      methods:
        output: true
        permalink: /:collection/:path/
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<p>Whatever: foo.bar</p>" in "_site/methods/configuration/index.html"

  Scenario: Rendered document in a layout
    Given I have an "index.html" page that contains "Collections: output => {{ site.collections[0].output }} label => {{ site.collections[0].label }} foo => {{ site.collections[0].foo }}"
    And I have a default layout that contains "<div class='title'>Tom Preston-Werner</div> {{content}}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
      methods:
        output: true
        foo:   bar
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Collections: output => true" in "_site/index.html"
    And I should see "label => methods" in "_site/index.html"
    And I should see "foo => bar" in "_site/index.html"
    And I should see "<p>Run your generators! default</p>" in "_site/methods/site/generate.html"
    And I should see "<div class='title'>Tom Preston-Werner</div>" in "_site/methods/site/generate.html"

  Scenario: Collections specified as an array
    Given I have an "index.html" page that contains "Collections: {% for method in site.methods %}{{ method.relative_path }} {% endfor %}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" unless Windows
    And I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if on Windows

  Scenario: Collections specified as an hash
    Given I have an "index.html" page that contains "Collections: {% for method in site.methods %}{{ method.relative_path }} {% endfor %}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" unless Windows
    And I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if on Windows

  Scenario: Rendered collection with document with future date
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: true
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "content for Rover" in "_site/puppies/rover.html"
    And the "_site/puppies/fido.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And the "_site/puppies/fido.html" file should exist

  Scenario: Access rendered collection with future dated document via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: true
    """
    And I have a "index.html" page that contains "Newest puppy: {% assign puppy = site.puppies.last %}{{ puppy.title }}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Newest puppy: Fido" in "_site/index.html"
    But the "_site/puppies/fido.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Newest puppy: Fido" in "_site/index.html"
    And the "_site/puppies/fido.html" file should exist

  Scenario: Access rendered and published collection documents via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: true
    """
    And I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    But I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    And I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    But I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    But the "_site/puppies/snowy.html" file should exist

  Scenario: Unrendered collection with future dated document
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: false
    """
    And I have a "foo.txt" file that contains "random static file"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/fido.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And the "_site/puppies/fido.html" file should not exist

  Scenario: Access unrendered collection with future dated document via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: false
    """
    And I have a "index.html" page that contains "Newest puppy: {% assign puppy = site.puppies.last %}{{ puppy.title }}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Newest puppy: Fido" in "_site/index.html"
    But the "_site/puppies/fido.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Newest puppy: Fido" in "_site/index.html"
    And the "_site/puppies/fido.html" file should not exist

  Scenario: Access unrendered but publishable collection documents via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: false
    """
    And I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    But I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    And I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    But I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist

  Scenario: Access rendered collection with future date and unpublished flag via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: true
    """
    And I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    But I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    And I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --unpublished
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should see "<div>Figor</div>" in "_site/index.html"
    But I should see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/figor.html" file should exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --unpublished --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should see "<div>Figor</div>" in "_site/index.html"
    But I should see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should exist
    And the "_site/puppies/snowy.html" file should exist
    And the "_site/puppies/figor.html" file should exist
    And the "_site/puppies/hardy.html" file should exist

  Scenario: Access unrendered collection with future date and unpublished flag via Liquid
    Given I have a _puppies directory
    And I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    And I have a "_config.yml" file with content:
    """
    collections:
      puppies:
        output: false
    """
    And I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    But I should see "<div>Snowy</div>" in "_site/index.html"
    And I should not see "<div>Figor</div>" in "_site/index.html"
    And I should not see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --unpublished
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should see "<div>Figor</div>" in "_site/index.html"
    But I should see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist
    When I run jekyll build --unpublished --future
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "<div>Rover</div>" in "_site/index.html"
    And I should see "<div>Snowy</div>" in "_site/index.html"
    And I should see "<div>Figor</div>" in "_site/index.html"
    But I should see "<div>Hardy</div>" in "_site/index.html"
    And the "_site/puppies/rover.html" file should not exist
    And the "_site/puppies/snowy.html" file should not exist
    And the "_site/puppies/figor.html" file should not exist
    And the "_site/puppies/hardy.html" file should not exist

  Scenario: All the documents
    Given I have an "index.html" page that contains "All documents: {% for doc in site.documents %}{{ doc.relative_path }} {% endfor %}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "All documents: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" unless Windows
    And I should see "All documents: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if on Windows

  Scenario: Documents have an output attribute, which is the converted HTML
    Given I have an "index.html" page that contains "Second document's output: {{ site.documents[2].output }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Second document's output: <p>Use <code class=\"language-plaintext highlighter-rouge\">Jekyll.configuration</code> to build a full configuration for use w/Jekyll.</p>\n\n<p>Whatever: foo.bar</p>" in "_site/index.html"

  Scenario: Documents have an output attribute, which is the converted HTML based on site.config
    Given I have an "index.html" page that contains "Second document's output: {{ site.documents[2].output }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    kramdown:
      guess_lang: false
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Second document's output: <p>Use <code>Jekyll.configuration</code> to build a full configuration for use w/Jekyll.</p>\n\n<p>Whatever: foo.bar</p>" in "_site/index.html"

  Scenario: Filter documents by where
    Given I have an "index.html" page that contains "{% assign items = site.methods | where: 'whatever','foo.bar' %}Item count: {{ items.size }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Item count: 2" in "_site/index.html"

  Scenario: Sort by title
    Given I have an "index.html" page that contains "{% assign items = site.methods | sort: 'title' %}2. of {{ items.size }}: {{ items[2].output }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "2. of 10: <p>Page without title.</p>" in "_site/index.html" unless Windows
    And I should see "2. of 9: <p>Page without title.</p>" in "_site/index.html" if on Windows

  Scenario: Sort by relative_path
    Given I have an "index.html" page that contains "Collections: {% assign methods = site.methods | sort: 'relative_path' %}{{ methods | map:"title" | join: ", " }}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
    - methods
    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: this is a test!, Collection#entries, Jekyll.configuration, Jekyll.escape, Jekyll.sanitized_path, Site#generate, Initialize, Ellipsis Path, Site#generate, YAML with Dots" in "_site/index.html" unless Windows
    And I should see "Collections: this is a test!, Collection#entries, Jekyll.configuration, Jekyll.escape, Jekyll.sanitized_path, Site#generate, Initialize, Ellipsis Path, YAML with Dots" in "_site/index.html" if on Windows

  Scenario: Sort all entries by a Front Matter key defined in all entries
    Given I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    And I have fixture collections
    And I have a _layouts directory
    And I have a "_layouts/tutorial.html" file with content:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    And I have a "_config.yml" file with content:
    """
    collections:
      tutorials:
        output: true
        sort_by: lesson

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: Getting Started, Let's Roll!, Dive-In and Publish Already!, Tip of the Iceberg, Extending with Plugins, Graduation Day" in "_site/index.html"
    And I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    And I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    But I should see "Previous: Getting Started" in "_site/tutorials/lets-roll.html"
    And I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Scenario: Sort all entries by a Front Matter key defined in only some entries
    Given I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    And I have fixture collections
    And I have a _layouts directory
    And I have a "_layouts/tutorial.html" file with content:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    And I have a "_config.yml" file with content:
    """
    collections:
      tutorials:
        output: true
        sort_by: approx_time

    defaults:
    - scope:
        path: ""
        type: tutorials
      values:
        layout: tutorial

    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "'approx_time' not defined" in the build output
    And I should see "Collections: Extending with Plugins, Let's Roll!, Getting Started, Graduation Day, Dive-In and Publish Already!, Tip of the Iceberg" in "_site/index.html"
    And I should see "Previous: Getting Started" in "_site/tutorials/graduation-day.html"
    And I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/graduation-day.html"

  Scenario: Manually sort entries
    Given I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    And I have fixture collections
    And I have a _layouts directory
    And I have a "_layouts/tutorial.html" file with content:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    And I have a "_config.yml" file with content:
    """
    collections:
      tutorials:
        output: true
        order:
          - getting-started.md
          - tip-of-the-iceberg.md
          - lets-roll.md
          - dive-in-and-publish-already.md
          - graduation-day.md
          - random-plugins.md

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: Getting Started, Tip of the Iceberg, Let's Roll!, Dive-In and Publish Already!, Graduation Day, Extending with Plugins" in "_site/index.html"
    And I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    And I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    But I should see "Previous: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    And I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Scenario: Manually sort some entries
    Given I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    And I have fixture collections
    And I have a _layouts directory
    And I have a "_layouts/tutorial.html" file with content:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    And I have a "_config.yml" file with content:
    """
    collections:
      tutorials:
        output: true
        order:
          - getting-started.md
          - lets-roll.md
          - dive-in-and-publish-already.md
          - graduation-day.md

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    When I run jekyll build
    Then I should get a zero exit status
    Then the _site directory should exist
    And I should see "Collections: Getting Started, Let's Roll!, Dive-In and Publish Already!, Graduation Day, Extending with Plugins, Tip of the Iceberg" in "_site/index.html"
    And I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    And I should not see "Previous: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    And I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    But I should see "Previous: Getting Started" in "_site/tutorials/lets-roll.html"
    And I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Scenario: Rendered collection with date/dateless filename
    Given I have an "index.html" page that contains "Collections: {% for method in site.thanksgiving %}{{ method.title }} {% endfor %}"
    And I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
      thanksgiving:
        output: true
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Thanksgiving Black Friday" in "_site/index.html"
    And I should see "Happy Thanksgiving" in "_site/thanksgiving/2015-11-26-thanksgiving.html"
    And I should see "Black Friday" in "_site/thanksgiving/black-friday.html"

  Scenario: Rendered collection with custom permalinks and static file contents
    Given I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
      methods:
        output: true
        permalink: /:collection/:name
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "I have no front matter." in "_site/methods/extensionless_static_file"

  Scenario: Rendered collection with an extensionless document
    Given I have fixture collections
    And I have a "_config.yml" file with content:
    """
    collections:
      methods:
        output: true
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "I have no file extension but I should still be a part of the collection." in "_site/methods/collection/entries"

  Scenario: Rendered collection with an extensionless document in a strict site
    Given I have fixture collections
    And I have a _posts directory
    And I have an "_posts/2019-12-26-extensioned.md" file that contains "Hello!"
    And I have an "_posts/2019-12-26-extensionless" file that contains "Aloha!"
    And I have an "index.md" page that contains "{{ site.posts | map: 'title' }}"
    And I have a "_config.yml" file with content:
    """
    strict_front_matter: true
    collections:
      methods:
        output: true
    """
    When I run jekyll build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "I have no file extension but I should still be a part of the collection." in "_site/methods/collection/entries"
    And I should see "Extensioned" in "_site/index.html"
    But I should not see "Extensionless" in "_site/index.html"
