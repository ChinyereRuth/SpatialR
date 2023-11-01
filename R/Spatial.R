# Initialize the description of the package; edit the file with all relevant details.
install.packages("devtools")
library(devtools)

usethis::use_description()

# Initialize a file to document the package; this file will be created in the folder `/R`.
usethis::use_package_doc()

# Initialize a license; check other alternatives like `usethis::use_ccby_license()`.
usethis::use_mit_license()

usethis::use_data_raw()
# Turn the project into a git repository.
usethis::use_git()
# Use GitHub if desired.
usethis::use_github()

devtools::check()


#Writing the first function
install.packages("raster")
library(raster)

calculate_slope_aspect <- function(dem) {
  # Calculate slope
  dzdx <- focal(dem, matrix(c(-1,0,1,-2,0,2,-1,0,1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  dzdy <- focal(dem, matrix(c(1,2,1,0,0,0,-1,-2,-1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  slope <- atan(sqrt(dzdx^2 + dzdy^2))

  # Convert slope to degrees
  slope <- slope * (180 / pi)

  # Calculate aspect
  aspect <- atan2(dzdy, -dzdx)

  # Convert aspect to degrees
  aspect <- (aspect * (180 / pi) + 360) %% 360

  return(list(slope = slope, aspect = aspect))
}
## example of how you can use this function
install.packages("raster")
# Load DEM
elevation_raster <- raster("/Users/chinyereottah/Desktop/Mac/SpatialR/data-raw/CanDEM.tif")

# Calculate slope and aspect
result <-calculate_slope_aspect(elevation_raster)


# Access the slope and aspect rasters
slope_raster <- result$slope
aspect_raster <- result$aspect

# Plot the results
plot(slope_raster, main="Slope")
plot(aspect_raster, main="Aspect")

# Run the following function to create the documentation; the documentation goes in folder `/man`.

## add roxygenise


install.packages("roxygen2")
library(roxygen2)

#' Calculate Slope and Aspect from a Digital Elevation Model (DEM)
#'
#' This function computes both slope and aspect from a Digital Elevation Model (DEM).
#'
#' @param dem A raster object representing the Digital Elevation Model.
#' @return A list containing two raster objects: "slope" representing the slope and "aspect" representing the aspect.
#' @export
#'
#' @examples
#' \dontrun{
#' # Example usage
#' elevation_raster <- raster("/Users/chinyereottah/Desktop/Mac/SpatialR/data-raw/CanDEM.tif")
#' result <- calculate_slope_aspect(elevation_raster)
#' slope_raster <- result$slope
#' aspect_raster <- result$aspect
#' plot(slope_raster, main="Slope")
#' plot(aspect_raster, main="Aspect")
#' }
#'
#' @seealso \code{\link[raster]{focal}}, \code{\link[raster]{atan}}, \code{\link[base]{atan2}}
#'
#' @import raster
#' @importFrom raster focal
#' @importFrom raster atan
#' @importFrom base atan2
#'
#' @author Chinyere Ottah
#'
#' @keywords spatial
#'
#' @examples
#' \dontrun{
#' # Example usage
#' elevation_raster <- raster("/Users/chinyereottah/Desktop/Mac/SpatialR/data-raw/CanDEM.tif")
#' result <- calculate_slope_aspect(elevation_raster)
#' slope_raster <- result$slope
#' aspect_raster <- result$aspect
#' plot(slope_raster, main="Slope")
#' plot(aspect_raster, main="Aspect")
#' }
calculate_slope_aspect <- function(dem) {
  # Function implementation goes here
}

roxygen2::roxygenise()



devtools::document()

# As you add data and/or functions to your package you need to re-run `devtools::document()` to update the documentation.

# After making changes or updating the package you can run your checks again.
devtools::check()

# This command will build the package
devtools::build()

# Create a README file for your repository. Edit the file as appropriate AND KNIT.
usethis::use_readme_rmd()

# If you are using GitHub and would like to create a web page for your package, use the following function.
usethis::use_pkgdown_github_pages()



