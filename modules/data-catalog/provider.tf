terraform {
  required_version = ">= 1.0.0, < 2.0.0"
    
  }

  provider "google" {
  project     = "YOUR PROJECT_ID HERE"
  region      = "us-central1"
  zone        = "us-central1-c"
  //credentials = "YOUR_CREDENTIALS_JSON HERE" 
}
  
  provider "google-beta" {
  project = "responsible-map-353321"
  region  = "us-central1"
  zone    = "us-central1c-c"
  //credentials = "YOUR_CREDENTIALS_JSON HERE" 

}

