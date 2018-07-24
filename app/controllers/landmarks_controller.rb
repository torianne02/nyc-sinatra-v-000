class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save

    if !params[:title][:name].empty?
      @figure.titles << Title.new(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.new(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end
end
