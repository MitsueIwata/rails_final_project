class CommunitiesController < ApplicationController
	def show
	end

	def create
	end

	def new
	end

	def index
		@community = Community.all
	end
end