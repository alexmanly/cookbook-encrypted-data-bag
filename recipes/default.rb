#
# Cookbook Name:: encrypted-data-bag
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

# See README.md to explain the key setup for this example

# This example pulls in the secret from this cookbook.
# The secret could also be stored in a secure location on your network. 
cookbook_file "/tmp/encrypted_data_bag_secret" do
	source "encrypted_data_bag_secret"
	action :create
end

if File.exist?("/tmp/encrypted_data_bag_secret")
  secret = Chef::EncryptedDataBagItem.load_secret("/tmp/encrypted_data_bag_secret")
  creds = Chef::EncryptedDataBagItem.load("admins", "sally", secret)
 
  log "DECRYPTED PASSWORD>>>>" + creds["pwd"] 
end  

