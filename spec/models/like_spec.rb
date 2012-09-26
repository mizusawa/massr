# -*- coding: utf-8 -*-
require 'spec_helper'
require 'models/like'
require 'models/user'

describe 'Massr::Like' do
	describe '#to_hash' do
		before :all do
			Massr::User.collection.remove
			@user = Massr::User.create_by_registration_form(prototype_user(0))
			@like = Massr::Like.new(:user => @user)
			puts @like.to_json
		end
		subject{ @like.to_hash }

		it {should be_a_kind_of(Hash)}
		it {subject['id'].should be_a_kind_of(BSON::ObjectId)}
		it {subject['user'].should be_a_kind_of(Hash)}
	end
end