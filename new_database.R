

new_paper_fun <- function(){
        new_paper = list(authors = NA, year = NA, studies = NA, "comments for this paper?" = NA)
                
        i <- 1
        while(i <= length(new_paper)){
                if(names(new_paper[i]) != "studies"){
                        temp_input <- readline(paste(prompt = names(new_paper[i]), ": ", sep = ""))
                        new_paper[i] <- temp_input
                } else {
                        new_paper[i] <- list(new_study_fun())
                }
                
                if(temp_input == "UNDO"){
                        i <- i-1
                } else {
                        i <- i+1
                }
        }
        return(new_paper)
}

new_study_fun <- function(){

        print("NEW STUDY")
        
        new_study = list (species = NA, n = NA, n_female = NA, trials_per_session = NA, sessions_per_condition = NA, side_by_side = NA, conditions = NA)
        j <- 1
        while(j <= length(new_study)){
                if(names(new_study[j]) != "conditions"){
                        temp_input <- readline(paste(prompt = names(new_study[j]), ": ", sep = ""))
                        new_study[j] <- temp_input
                } else {
                        new_study[j] <- list(new_conditions_fun())
                }
                if(temp_input == "UNDO"){
                        j <- j-1
                } else {
                        j <- j+1
                }
        }
         

        more_studies <- readline(prompt = "more studies? ")
        
        if(more_studies == "UNDO"){
                new_study$conditions <- list(new_conditions_fun())
        }
        
        new_study = list(new_study)
        
        while(more_studies != "n"){
                
                print("NEW STUDY")
                
                newer_study = list (species = NA, n = NA, n_female = NA, trials_per_session = NA, sessions_per_condition = NA, conditions = NA)
                j <- 1
                while(j <= length(newer_study)){
                        if(names(newer_study[j]) != "conditions"){
                                temp_input <- readline(paste(prompt = names(newer_study[j]), ": ", sep = ""))
                                newer_study[j] <- temp_input
                        } else {
                                newer_study[j] <- list(new_conditions_fun())
                        }
                        if(temp_input == "UNDO"){
                                j <- j-1
                        } else {
                                j <- j+1
                        }
                        
                }
                

                new_study <- c(new_study, list(newer_study))
                
                more_studies <- readline(prompt = "more studies? ")
        }
        return(new_study)
}

new_conditions_fun <- function(){
        
        print("NEW CONDITON")
        conditions <- list()
        
        empty_condition = character(length = 5)
        names(empty_condition) = c("distribution_inequality", "partner_present", "effort_inequality", "effort", "reward_received")
        
        k <- 1
        while(k <= 5){
                temp_input <- readline(paste(prompt = names(empty_condition[k]), ": ", sep = ""))
                empty_condition[k] <- temp_input
                if(temp_input == "UNDO"){
                        k <- k-1
                } else {
                        k <- k+1
                }
        }
        
        conditions <- c(conditions, list(empty_condition))
        
        more_conditions = readline(prompt = "more conditions?")
        
        while(more_conditions != "n"){
                
                print("NEW CONDITION")
                
                empty_condition = character(length = 5)
                names(empty_condition) = c("distribution_inequality", "partner_present", "effort_inequality", "effort", "reward_received")
                
                k <- 1
                while(k <= 5){
                        temp_input <- readline(paste(prompt = names(empty_condition[k]), ": ", sep = ""))
                        empty_condition[k] <- temp_input
                        if(temp_input == "UNDO"){
                                k <- k-1
                        } else {
                                k <- k+1
                        }
                }  
                
                conditions <- c(conditions, list(empty_condition))
                
                more_conditions = readline(prompt = "more conditions? ")
        }
        
        return(conditions)
}

new_database_fun <- function(){
        new_database <- list()
        
        more_papers <- readline("more papers? ")
        
        while(more_papers != "n"){
                temp_paper <- new_paper_fun()
                new_database <- c(new_database, list(temp_paper))
                more_papers <- readline("more papers? ")
        }
        
        return(new_database)
}

database = new_database_fun()

##script for adding to new_database

more_papers <- readline("more papers? ")

while(more_papers != "n"){
        temp_paper <- new_paper_fun()
        new_database <- c(new_database, list(temp_paper))
        more_papers <- readline("more papers? ")
}

##end script

# ##adding reward_received since this was forgotten
# 
# for(i in 1:length(new_database)){
#         for(j in 1:length(new_database[[i]]$studies)){
#                 for(k in 1:length(new_database[[i]]$studies[[j]]$conditions)){
#                         new_database[[i]]$studies[[j]]$conditions[[k]]$reward_received = "y"
#                 }
#         }
# }


## backup
# backup_database <- new_database

save(new_database, file="database1.RData")

