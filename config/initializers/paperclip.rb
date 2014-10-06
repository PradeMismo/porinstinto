# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = 'www.porinstinto.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'