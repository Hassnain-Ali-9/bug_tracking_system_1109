# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    if user.nil?
      #can :read, [home, About, Help]
    else
      case user.user_type
        when "manager"
          manager_abilities(user)
        when "developer"
          developer_abilities(user)
        when "QA"
          qa_abilities(user)
      end
    end
  end

  def manager_abilities(user)
    can :manage, Project
    can :manage, UserProject 
    can :read, Bug
  end

  def developer_abilities(user)
    can :read, Project, id: user.projects.pluck(:id)
    can :read, Bug, project: { id: user.projects.pluck(:id) }
    #can :update, Bug, do |bug|
    #bug.solver_id == user.id && bug.changes.keys == ["status"]
     #end
     can :update, Bug, solver_id: user.id
     #bug.changes.keys == ["status"]
   #end

    
    #can :update, Bug, id: user.Bugs.pluck(:id)
  end

  def qa_abilities(user)
    can :read, Project, id: user.projects.pluck(:id)
    #can :manage, Bug, project: { id: user.project_ids }
    can :read, Bug, project: { id: user.projects.pluck(:id) }
    can :manage, Bug, creator: user


  end




    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
       #return unless user.manager?
       #can :manage, :all

       #return unless user.developer?
       #can :read, Project

       #return unless user.QA?
       #can :read, Project

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  
end
