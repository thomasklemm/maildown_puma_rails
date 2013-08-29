## Issue

This is an example app for tracking down why [mail_view](Gem) (a way to preview emails in Rails visually) renders [Maildown]() templates always with the default maildown parser. This only happens when Puma is the app server, and does not happen with Thin.

What does this mean:
The maildown custom renderer setting in `config/initializers/maildown.rb` are somehow ignored in the Puma setting. Mails are always rendered with the default Kramdown parser.

```ruby
# config/initializers/maildown.rb
Maildown::MarkdownEngine.set do |text|
  text.html_safe
end
```

Expected (using Thin):

![Expected (Using Thin)](http://new.tinygrab.com/07ad86749030afc89503568cb1a18b4c526efe98c2.png)

Unexpected (using Puma): Renders with the default Kramdown renderer.

![Unexpected (Using Puma)](http://new.tinygrab.com/07ad86749082b340785f0a2e83ccf9980ebdfe77ca.png)

Tests and actually sending emails respect the customized settings from the initializer as expected, so this issue only happens when previewing emails with Mailview.

## Reproduce:

- Clone the app
- Start the Rails server
- Visit 'http://localhost:3000/mail_view/hello'
- The plain markdown text is expected to be rendered in the HTML view.
