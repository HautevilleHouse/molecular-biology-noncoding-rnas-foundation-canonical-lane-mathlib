import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure RnaSequence where
  bases : String
  gcContent : ℝ

structure RnaSecondaryStructurePackage where
  sequence : RnaSequence
  minimumFreeEnergy : ℝ
  basePairs : List (ℕ × ℕ)
  hairpins : List (List ℕ)
  pseudoknots : List (List ℕ)
  structureValidated : Prop

structure RnaSecondaryStructureEvidence (S : RnaSecondaryStructurePackage) where
  energyMinimized : S.minimumFreeEnergy ≤ 0
  basePairingValid : ∀ (i, j) ∈ S.basePairs, i < j
  hairpinsValid : ∀ h ∈ S.hairpins, h.length ≥ 3
  structureValidatedClosed : S.structureValidated

def RnaSecondaryStructureClosed (S : RnaSecondaryStructurePackage) : Prop :=
  S.minimumFreeEnergy ≤ 0 ∧ (∀ (i, j) ∈ S.basePairs, i < j) ∧
  (∀ h ∈ S.hairpins, h.length ≥ 3) ∧ S.structureValidated

theorem rna_secondary_structure_closed_from_evidence
    (S : RnaSecondaryStructurePackage) (E : RnaSecondaryStructureEvidence S) :
    RnaSecondaryStructureClosed S := by
  exact And.intro E.energyMinimized (And.intro E.basePairingValid (And.intro E.hairpinsValid E.structureValidatedClosed))

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse