require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "hello" do
    mail = Mailer.hello
    assert_equal "Hello", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match 'Mail body with [a link](http://example.com).', mail.body.encoded
    # assert_match '<p>Mail body with <a href=\"http://example.com\">a link</a>.</p>', mail.body.encoded
  end

end
