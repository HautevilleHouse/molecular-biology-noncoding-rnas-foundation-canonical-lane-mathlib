import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaBindingProteinsPackage where
  rbpInteractions : Prop
  rbpBindingSites : Prop
  rbpRegulation : Prop
  complexFormation : Prop

structure RnaBindingProteinsEvidence (R : RnaBindingProteinsPackage) where
  rbpInteractionsClosed : R.rbpInteractions
  rbpBindingSitesClosed : R.rbpBindingSites
  rbpRegulationClosed : R.rbpRegulation
  complexFormationClosed : R.complexFormation

def RnaBindingProteinsClosed (R : RnaBindingProteinsPackage) : Prop :=
  R.rbpInteractions ∧ R.rbpBindingSites ∧ R.rbpRegulation ∧ R.complexFormation

theorem rna_binding_proteins_closed_from_evidence
    (R : RnaBindingProteinsPackage) (E : RnaBindingProteinsEvidence R) :
    RnaBindingProteinsClosed R := by
  exact And.intro E.rbpInteractionsClosed
    (And.intro E.rbpBindingSitesClosed
      (And.intro E.rbpRegulationClosed E.complexFormationClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse