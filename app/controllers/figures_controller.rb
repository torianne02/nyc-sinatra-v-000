class FiguresController < ApplicationController
  get :'/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.new(name: params[:title][:name])
    end
end
