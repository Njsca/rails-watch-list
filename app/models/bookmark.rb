class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, :list_id, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end

# Validation
# A movie must have a unique title and an overview.
# A list must have a unique name.
# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.

# Associations
# A list has many bookmarks
# A list has many movies through bookmarks
# A movie has many bookmarks
# A bookmark belongs to a movie
# A bookmark belongs to a list
# You can’t delete a movie if it is referenced in at least one bookmark.
# When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
