import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaInterferencePathway where
  dicerProcessing : Prop
  riscLoading : Prop
  mrnaTargeting : Prop
  translationalRepression : Prop
  mrnaCleavage : Prop

structure RnaInterferencePathwayEvidence (P : RnaInterferencePathway) where
  dicerProcessingClosed : P.dicerProcessing
  riscLoadingClosed : P.riscLoading
  mrnaTargetingClosed : P.mrnaTargeting
  translationalRepressionClosed : P.translationalRepression
  mrnaCleavageClosed : P.mrnaCleavage

def RnaInterferencePathwayClosed (P : RnaInterferencePathway) : Prop :=
  P.dicerProcessing ∧ P.riscLoading ∧ P.mrnaTargeting ∧ P.translationalRepression ∧ P.mrnaCleavage

theorem rna_interference_pathway_closed_from_evidence
    (P : RnaInterferencePathway) (E : RnaInterferencePathwayEvidence P) :
    RnaInterferencePathwayClosed P := by
  exact And.intro E.dicerProcessingClosed
    (And.intro E.riscLoadingClosed
      (And.intro E.mrnaTargetingClosed
        (And.intro E.translationalRepressionClosed E.mrnaCleavageClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse