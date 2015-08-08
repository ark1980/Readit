class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  scope :ordered_by_title, -> { order('title DESC') }

  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

  def markdown_title
    render_as_markdown(self.title)
  end

  def markdown_body
    render_as_markdown(self.body)
  end

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {
      fenced_code_blocks: true,
      highlight: true,
      no_intra_emphasis: true
    }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
