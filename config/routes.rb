# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb     URI Pattern                                                                              Controller#Action
#                      root GET      /                                                                                        pages#main
#                    logout GET      /logout(.:format)                                                                        pages#logout
#         apply_job_opening PUT      /job_openings/:id/apply(.:format)                                                        job_openings#apply
#              job_openings GET      /job_openings(.:format)                                                                  job_openings#index
#                           POST     /job_openings(.:format)                                                                  job_openings#create
#           new_job_opening GET      /job_openings/new(.:format)                                                              job_openings#new
#          edit_job_opening GET      /job_openings/:id/edit(.:format)                                                         job_openings#edit
#               job_opening GET      /job_openings/:id(.:format)                                                              job_openings#show
#                           PATCH    /job_openings/:id(.:format)                                                              job_openings#update
#                           PUT      /job_openings/:id(.:format)                                                              job_openings#update
#                           DELETE   /job_openings/:id(.:format)                                                              job_openings#destroy
#          login_applicants GET|POST /applicants/login(.:format)                                                              applicants#login
#                applicants GET      /applicants(.:format)                                                                    applicants#index
#                           POST     /applicants(.:format)                                                                    applicants#create
#             new_applicant GET      /applicants/new(.:format)                                                                applicants#new
#            edit_applicant GET      /applicants/:id/edit(.:format)                                                           applicants#edit
#                 applicant GET      /applicants/:id(.:format)                                                                applicants#show
#                           PATCH    /applicants/:id(.:format)                                                                applicants#update
#                           PUT      /applicants/:id(.:format)                                                                applicants#update
#                           DELETE   /applicants/:id(.:format)                                                                applicants#destroy
#           login_employers GET|POST /employers/login(.:format)                                                               employers#login
#                 employers GET      /employers(.:format)                                                                     employers#index
#                           POST     /employers(.:format)                                                                     employers#create
#              new_employer GET      /employers/new(.:format)                                                                 employers#new
#             edit_employer GET      /employers/:id/edit(.:format)                                                            employers#edit
#                  employer GET      /employers/:id(.:format)                                                                 employers#show
#                           PATCH    /employers/:id(.:format)                                                                 employers#update
#                           PUT      /employers/:id(.:format)                                                                 employers#update
#                           DELETE   /employers/:id(.:format)                                                                 employers#destroy
#        rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'pages#main'
  match 'logout', to: 'pages#logout', via: [:get]

  resources :job_openings do
    put :apply, on: :member
  end
  resources :applicants do
    match :login, on: :collection, via: %i[get post]
  end
  resources :employers do
    match :login, on: :collection, via: %i[get post]
  end
end
