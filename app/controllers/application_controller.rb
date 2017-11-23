require 'net/http'
require 'uri'
require 'mechanize'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @rankings = Ranking.order("score asc")
    render "layouts/test"
  end

  def about
    render "ranking/about"
  end

  def show
    render "ranking/show"
  end

  def upload
    image1 = params[:image1]
    image1_path = Rails.root.join('public', image1.original_filename)
    File.open(image1_path, 'wb') do |file|
      file.write(image1.read)
    end
    image2 = params[:image2]
    image2_path = Rails.root.join('public', image2.original_filename)
    File.open(image2_path, 'wb') do |file|
      file.write(image2.read)
    end
    puts "success"
    score = apipost(File.open("/#{image1_path}"), File.open("/#{image2_path}"))

    Ranking.create([person1: params[:person1],
                    person1_path: image1.original_filename,
                    person2: params[:person2],
                    person2_path: image2.original_filename,
                    score: score])
    
    redirect_to('/') unless score.nil?
    
  end

  def apipost(file1, file2)
    request_url = "https://www.floydlabs.com/expose/FKB3MpcMLYYitHkQT79EFD"
    agent = Mechanize.new
    response = agent.post(request_url, {
                            file1:  file1,
                            file2: file2
                          })
    return response.body
   

  end

end
