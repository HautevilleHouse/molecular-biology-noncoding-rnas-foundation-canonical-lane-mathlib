import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure PiwiInteractingRnaPathway where
  piRNABiogenesis : Prop
  piwiProteinLoading : Prop
  transposonSilencing : Prop
  germlineMaintenance : Prop
  epigeneticProgramming : Prop

structure PiwiInteractingRnaPathwayEvidence (P : PiwiInteractingRnaPathway) where
  piRNABiogenesisClosed : P.piRNABiogenesis
  piwiProteinLoadingClosed : P.piwiProteinLoading
  transposonSilencingClosed : P.transposonSilencing
  germlineMaintenanceClosed : P.germlineMaintenance
  epigeneticProgrammingClosed : P.epigeneticProgramming

def PiwiInteractingRnaPathwayClosed (P : PiwiInteractingRnaPathway) : Prop :=
  P.piRNABiogenesis ∧ P.piwiProteinLoading ∧ P.transposonSilencing ∧ P.germlineMaintenance ∧
  P.epigeneticProgramming

theorem piwi_interacting_rna_pathway_closed_from_evidence
    (P : PiwiInteractingRnaPathway) (E : PiwiInteractingRnaPathwayEvidence P) :
    PiwiInteractingRnaPathwayClosed P := by
  exact And.intro E.piRNABiogenesisClosed
    (And.intro E.piwiProteinLoadingClosed
      (And.intro E.transposonSilencingClosed
        (And.intro E.germlineMaintenanceClosed E.epigeneticProgrammingClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse