 # config/intializers/paperclip_nginx_upload.rb
 require 'paperclip/nginx/upload'

 Paperclip::Nginx::Upload::IOAdapter.default_options.merge!(
   # location where nginx places file uploads
   tmp_path_whitelist: ['/tmp/nginx_uploads/**'],

   # Change this option to true to move temp files created 
   # by nginx to the paperclip tmp file location. By default
   # files are copied.
   move_tempfile: false
 )    