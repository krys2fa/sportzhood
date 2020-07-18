# rubocop:disable Metrics/BlockLength
namespace :export do
  desc 'Export users'
  task export_to_seeds: :environment do
    User.all.each do |users|
      excluded_keys = %w[created_at updated_at id]
      serialized = users
        .serializable_hash
        .delete_if { |key, _value| excluded_keys.include?(key) }
      puts "User.create(#{serialized})"
    end
  end

  desc 'Export articles'
  task export_to_seeds: :environment do
    Article.all.each do |articles|
      excluded_keys = %w[created_at updated_at id]
      serialized = articles
        .serializable_hash
        .delete_if { |key, _value| excluded_keys.include?(key) }
      puts "Article.create(#{serialized})"
    end
  end

  desc 'Export votes'
  task export_to_seeds: :environment do
    Vote.all.each do |votes|
      excluded_keys = %w[created_at updated_at id]
      serialized = votes
        .serializable_hash
        .delete_if { |key, _value| excluded_keys.include?(key) }
      puts "Vote.create(#{serialized})"
    end
  end

  desc 'Export categories'
  task export_to_seeds: :environment do
    Category.all.each do |categories|
      excluded_keys = %w[created_at updated_at id]
      serialized = categories
        .serializable_hash
        .delete_if { |key, _value| excluded_keys.include?(key) }
      puts "Category.create(#{serialized})"
    end
  end

  desc 'Export article_categories'
  task export_to_seeds: :environment do
    ArticleCategory.all.each do |article_categories|
      excluded_keys = %w[created_at updated_at id]
      serialized = article_categories
        .serializable_hash
        .delete_if { |key, _value| excluded_keys.include?(key) }
      puts "ArticleCategory.create(#{serialized})"
    end
  end
end
# rubocop:enable Metrics/BlockLength
