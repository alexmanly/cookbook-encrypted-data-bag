# encrypted-data-bag

This cookbook was written to demonstrate the usage of encrypted databags.
It assumes you have a working ChefDK installation with Test Kitchen and Vagrant setup.

from the root of this cookbook run:

 
-  openssl rand -base64 512 > files/defaultencrypted_data_bag_secret
-  chef gem install knife-solo_data_bag
-  knife solo data bag create admins sally --secret-file files/default/encrypted_data_bag_secret 


