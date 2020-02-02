namespace :deploy do
    desc 'run deploy db tasks'
    task :migrateDB do
        on roles(:app) do
            within "#{current_path}" do
                with rails_env: "#{fetch(:stage)}" do
                execute :rake, "db:migrate"
                end
            end
        end
    end
    # task :roleback4 do
    #     on roles(:app) do
    #         within "#{current_path}" do
    #             with rails_env: "#{fetch(:stage)}" do
    #             execute :rake, "db:rollback STEP=4"
    #             end
    #         end
    #     end
    # end
    task :dropAndCreateDB do
        on roles(:app) do
            within "#{current_path}" do
                with rails_env: "#{fetch(:stage)}" do
                execute :rake, "db:drop"
                execute :rake, "db:create"
                end
            end
        end
    end
end