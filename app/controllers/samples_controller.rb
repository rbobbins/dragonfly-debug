class SamplesController < ApplicationController
	def index
		@samples = Sample.all
	end

	def new
		@sample = Sample.new
	end

	def create
		@sample = Sample.create(params[:sample].permit!)

		redirect_to samples_path
	end

	def edit
		@sample = Sample.find(params[:id])
	end

	def update
		@sample = Sample.find(params[:id])
		@sample.update_attributes(params[:sample].permit!)

		redirect_to samples_path
	end

	def duplicate
		@sample = Sample.find(params[:id])
		@sample.dup.save!

		redirect_to samples_path
	end
end