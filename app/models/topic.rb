class Topic < ActiveRecord::Base
  has_many :posts

  validates :title, length: { minimum: 5 }, presence: true

  will_paginate(page: params[:page], per_page: 50)
end
