% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph_GOspecies.R
\name{graphGOspecies}
\alias{graphGOspecies}
\title{Undirected network representation  for the results of functional
 enrichment analysis for one species}
\usage{
graphGOspecies(
  df,
  GOterm_field,
  option = "Categories",
  numCores = 2,
  saveGraph = FALSE,
  outdir = NULL
)
}
\arguments{
\item{df}{A data frame with the results of a functional enrichment analysis for
a species with an extra column "feature" with the features to be compared}

\item{GOterm_field}{This is a string with the column name of the GO terms (e.g: "Functional.Category")}

\item{option}{(values: "GO" or "Categories"). This option allows create either a graph where nodes are GO terms and edges are features or alternatively
a graph where nodes are features and edges are GO terms (default value="Categories")}

\item{numCores}{numeric, Number of cores to use for the process (default value numCores=2). For the example below, only one core will be used}

\item{saveGraph}{logical, if \code{TRUE} the function will allow save the graph in graphml format}

\item{outdir}{This parameter will allow save the graph file in a folder described here (e.g: "D:").This parameter only
works when saveGraph=TRUE}
}
\value{
This function will return a list with two slots: edges and nodes. Edges represents an edge list and their weights and
 nodes which represents the nodes and their respective weights
}
\description{
graphGOspecies is a function to create undirected graphs using two options:

1.) Nodes are GO terms such as biological processes and the edges are features.
 First, edges weights  are calculated as the intersection where cat(U) n cat(V) represents
 categories where the GO terms U and V are. While nBP is the total number of biological processes
 represented by the GO terms (1).Finally node weights are calculated as sum of all w(e) where the node is participant (2)
 (Please be patient, it requires a long time to finish).
 \deqn{w(e) = \frac{|cat(U) n cat(V)|}{|nBP|}}{%
 w(e) = |cat(U) n cat(V)| / |nBP| (1)}


 \deqn{K_w(U) = \sum(w(U,V))}{%
 K_w(U) = sum(w(U,V)) (2)}


2.) Nodes are features, the edges are the number of GO terms such as biological processes in your gene lists.
In this case the edge weights are calculated as the number of biological processes shared by a category expressed as BP(U) n BP(V)
nBP is the total number of biological processes (3). FInally, the node weights is calculated as the sum of all w(e) where the node is participant (4)

 \deqn{w(e) = \frac{|BP(U) n BP(V)|}{|nBP|}}{%
 w(e) = |BP(U) n BP(V)| / |nBP| (3)}

 \deqn{K_w(U) = \sum(w(U,V))}{%
 K_w(U) = sum(w(U,V)) (4)}
}
\examples{

#Loading example datasets
data(H_sapiens_compress)

GOterm_field <- "Functional_Category"

#Running function
x <- graphGOspecies(df=H_sapiens_compress,
                     GOterm_field=GOterm_field,
                     option = "Categories",
                     numCores=1,
                     saveGraph=FALSE,
                     outdir = NULL)

}
