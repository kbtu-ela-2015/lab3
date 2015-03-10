Rails.application.routes.draw do
  
  get 'parser/kolesa'

  get 'courses/listcourses', to: 'courses#listcourses', as: "list_courses"
  get 'users/viewregisteredcourses', to: 'users#viewregisteredcourses', as: "list_registered_courses"
  get 'courses/showByTeacher', to:'courses#showByTeacher', as: "show_courses_t"

  devise_for :users
  

  get 'users/:id2', to: 'users#coursereg', as: "user_reg"
  
  resources :courses
  get 'guest', to: 'welcome#guest', as: "guest_wait"

  delete 'courses/:id', to: 'courses#destroy', as: "course_destroy"

  root 'welcome#index'

  get 'viewgroups/:id', to: 'users#viewgroups', as: "user_register"
  get 'hello', to: 'welcome#hello'
  get 'studentlist', to: 'welcome#list'
  get 'users/', to: 'users#index'
  get 'users/:id/edit', to: 'users#edit', as: "user_edit"
  
  get 'user_show/:id', to: 'users#show', as: "user_show"

  get 'showByRole', to: 'users#showByRole', as: "show_teach_users"
  
  put 'users/:id/update', to: 'users#update', as: "user_update"
  
  delete 'users/:id', to: 'users#remove', as: "user_remove"

  get 'courses/:id/addgroup', to: 'courses#addgroup', as: "add_group"
  post 'courses/creategroup/:id', to: 'courses#creategroup', as: "create_group"
  get 'courses/:id1/:id2/editgroup', to: 'courses#editgroup', as: "group_edit"  
  put 'courses/:id1/:id2/updategroup', to: 'courses#updategroup', as: "group_update"

  delete 'courses/:id1/:id2', to: 'courses#groupremove', as: "group_remove"
  delete 'delnews/:id', to: 'users#delnews', as: "delnews"

  get 'show_course_users/:id', to: 'courses#showusers', as: "show_course_users"
  get 'addnews', to: 'users#addnews', as: "addnews"
  put 'createnews', to: 'users#createnews', as: "createnews"
  put 'updatenews/:id', to: 'users#updatenews', as: "updatenews"
  get 'shownews', to: 'users#shownews', as: "show_news"
  get 'editnews/:id', to: 'users#editnews', as: "editnews"

  get 'new_users', to: 'users#newusers', as: "new_users"
  get 'departments', to: 'users#showdepartment', as: "showdepartment"
  get 'newdepartment', to: 'users#newdepartment', as: "new_department"
  put 'createdepartment', to: 'users#createdepartment', as: "create_department"

  get 'departments/:id', to: 'users#showdep', as: "department_show"
  get 'departmentedit/:id', to: 'users#editdepartment', as: "department_edit"
  delete 'destroydepartment/:id', to: 'users#destroydepartment', as: "department_destroy"
  put 'updatedepartment/:id', to: 'users#updatedepartment', as: "update_department"
  
  

  # get 'courses/:id', to: 'courses#creategroup', as: 'create_group'
  # put 'courses/:id/newgroup', to:'coureses#newgroup', as: 'new_group'
end
