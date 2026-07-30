import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure RnaTranscriptCluster where
  transcriptSet : Type
  expressionProfile : transcriptSet → ℝ
  clusterAssignment : transcriptSet → ℕ
  clusterCenters : ℕ → ℝ
  withinClusterVariance : Prop
  betweenClusterSeparation : Prop

structure RnaTranscriptClusteringPackage where
  clusterCount : ℕ
  clusterAssignments : RnaTranscriptCluster
  varianceMinimized : Prop
  separationMaximized : Prop

structure RnaTranscriptClusteringEvidence (C : RnaTranscriptClusteringPackage) where
  varianceMinimizedClosed : C.varianceMinimized
  separationMaximizedClosed : C.separationMaximized

def RnaTranscriptClusteringClosed (C : RnaTranscriptClusteringPackage) : Prop :=
  C.varianceMinimized ∧ C.separationMaximized

theorem rna_transcript_clustering_closed_from_evidence
    (C : RnaTranscriptClusteringPackage) (E : RnaTranscriptClusteringEvidence C) :
    RnaTranscriptClusteringClosed C := by
  exact And.intro E.varianceMinimizedClosed E.separationMaximizedClosed

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse