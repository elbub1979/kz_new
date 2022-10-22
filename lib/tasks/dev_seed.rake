namespace :db do
  namespace :dev do
    task prepare: :environment do
      Rake::Task['db:seed'].invoke
    end
  end
end
