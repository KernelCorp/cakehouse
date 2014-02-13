class Feedback < ActiveRecord::Base
  attr_accessible :name, :photo, :text, :desc
  has_attached_file :photo,
                    :styles => {
                        :thumb => ["50x50#", :png],
                        :small => ["150x150#", :png],
                        :round => ["120x120#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
end