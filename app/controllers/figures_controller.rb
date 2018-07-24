class FiguresController < ApplicationController
  get :'/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.new(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
end
