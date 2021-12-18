class Task < ApplicationRecord
  def self.search(keyword)
    #タスクのタイトルと詳細で検索
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])

  end
end
