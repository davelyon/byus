module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

    when /the page/
      "html > body"

    when /the second link/
      [:css, ".links li:nth-child(2)"]

    when /bin public status/
      ".public"

    when /the (error|success) flash/
      "#flash > .#{$1}"

    when /the bins links/
      ".links"

    when /the page title/
      "h1.page_title"

    when /the title/
      "head > title"

    when /xml link title/
      [:css, "item > title"]

    when /xml title/
      [:css, "channel > title"]

    when /the top domains/
      "#domains"

    when /"(.+)"/
      $1

    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
