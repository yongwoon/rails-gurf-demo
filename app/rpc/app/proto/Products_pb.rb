# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: app/proto/Products.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "rpc.Product" do
    optional :id, :uint32, 1
    optional :name, :string, 2
    optional :price, :float, 3
  end
  add_message "rpc.GetProductReq" do
    optional :id, :uint32, 1
  end
  add_message "rpc.GetProductResp" do
    optional :product, :message, 1, "rpc.Product"
  end
  add_message "rpc.GetProductsReq" do
    optional :search, :string, 1
    optional :limit, :uint32, 2
  end
end

module Rpc
  Product = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.Product").msgclass
  GetProductReq = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.GetProductReq").msgclass
  GetProductResp = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.GetProductResp").msgclass
  GetProductsReq = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.GetProductsReq").msgclass
end
