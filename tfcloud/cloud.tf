terraform { 
  cloud { 
    
    organization = "gh-terra-train" 

    workspaces { 
      name = "my-example" 
    } 
  } 
}
