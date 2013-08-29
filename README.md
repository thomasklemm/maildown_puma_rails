This is an example app for tracking down why [mail_view](Gem) (a way to preview emails in Rails visually) renders [Maildown]() templates always with the default maildown parser. This only happens when Puma is the app server, and does not happen with Thin.

What does this mean:
The maildown custom renderer setting in `config/initializers/maildown.rb` are somehow ignored in the Puma setting. Mails are always rendered with the default Kramdown parser.

Tests and actually sending emails respect the customized settings from the initializer as expected.
