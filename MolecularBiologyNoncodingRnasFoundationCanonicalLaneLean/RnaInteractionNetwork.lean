import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaInteractionNetworkPackage where
  rnaProteinBinding : Prop
  rnaRnaDuplex : Prop
  competitiveEndogenous : Prop
  ceRNAEffect : Prop
  networkTopology : Prop

structure RnaInteractionNetworkEvidence (N : RnaInteractionNetworkPackage) where
  rnaProteinBindingClosed : N.rnaProteinBinding
  rnaRnaDuplexClosed : N.rnaRnaDuplex
  competitiveEndogenousClosed : N.competitiveEndogenous
  ceRNAEffectClosed : N.ceRNAEffect
  networkTopologyClosed : N.networkTopology

def RnaInteractionNetworkClosed (N : RnaInteractionNetworkPackage) : Prop :=
  N.rnaProteinBinding ∧ N.rnaRnaDuplex ∧
  N.competitiveEndogenous ∧ N.ceRNAEffect ∧ N.networkTopology

theorem rna_interaction_network_closed_from_evidence
    (N : RnaInteractionNetworkPackage) (E : RnaInteractionNetworkEvidence N) :
    RnaInteractionNetworkClosed N := by
  exact And.intro E.rnaProteinBindingClosed
    (And.intro E.rnaRnaDuplexClosed
      (And.intro E.competitiveEndogenousClosed
        (And.intro E.ceRNAEffectClosed E.networkTopologyClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse