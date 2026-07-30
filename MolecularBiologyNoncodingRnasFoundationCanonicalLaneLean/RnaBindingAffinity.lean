import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure BindingMolecule where
  moleculeType : String
  sequence : String
  concentration : ℝ

structure RnaBindingAffinityPackage where
  rnaSequence : String
  target : BindingMolecule
  dissociationConstant : ℝ
  bindingSite : ℕ
  bindingSpecific : Prop

structure RnaBindingAffinityEvidence (B : RnaBindingAffinityPackage) where
  bindingSiteValid : B.bindingSite > 0 ∧ B.bindingSite ≤ B.rnaSequence.length
  affinityMeasured : B.dissociationConstant > 0
  bindingSpecificClosed : B.bindingSpecific

def RnaBindingAffinityClosed (B : RnaBindingAffinityPackage) : Prop :=
  (B.bindingSite > 0 ∧ B.bindingSite ≤ B.rnaSequence.length) ∧
  B.dissociationConstant > 0 ∧ B.bindingSpecific

theorem rna_binding_affinity_closed_from_evidence
    (B : RnaBindingAffinityPackage) (E : RnaBindingAffinityEvidence B) :
    RnaBindingAffinityClosed B := by
  exact And.intro E.bindingSiteValid (And.intro E.affinityMeasured E.bindingSpecificClosed)

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse