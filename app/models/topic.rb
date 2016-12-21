class Topic < ApplicationRecord
    has_many :votes, dependent: :destroy # 删除topic的时候将相关的vote也删掉
end
