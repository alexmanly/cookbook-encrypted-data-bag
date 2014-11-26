#
# Cookbook Name:: encrypted-data-bag
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

# from the root of this cookbook run:
# openssl rand -base64 512 > files/default/encrypted_data_bag_secret
#
# chef gem install knife-solo_data_bag
# 
# knife solo data bag create admins sally --secret-file files/default/encrypted_data_bag_secret 

cookbook_file "/tmp/encrypted_data_bag_secret" do
	source "encrypted_data_bag_secret"
	action :create
end

if File.exist?("/tmp/encrypted_data_bag_secret")
  secret = Chef::EncryptedDataBagItem.load_secret("/tmp/encrypted_data_bag_secret")
  creds = Chef::EncryptedDataBagItem.load("admins", "sally", secret)
 
  log "DECRYPTED PASSWORD>>>>" + creds["pwd"] 
end  

