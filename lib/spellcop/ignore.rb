module Spellcop
  IGNORE = [
    'utf', 'param', 'admin', 'github', 'http', 'i18n',
    'klass', 'upsert', 'datetime', 'config', 'gravatar',
    'rubocop', 'html', 'iphone', 'heroku', 'async', 'backtrace',
    'richtext', 'rollbar', 'username', 'rspec', 'nginx', 'stylesheet',
    'threadsafe', 'uuid', 'dyno', 'subdomain'
  ]
  
  class ::String
    def spellcop_ignore?
      IGNORE.include? downcase or IGNORE.include? downcase[0...(length - 1)] or
      chars.first == chars.first.upcase or
      include? '_' or include? '-' or
      size < 4
    end
  end
end