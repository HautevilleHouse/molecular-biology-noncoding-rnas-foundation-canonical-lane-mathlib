import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure SequenceAlignment where
  species : String
  alignedSequence : String
  identity : ℝ

structure NoncodingRnaConservationPackage where
  referenceSequence : String
  alignments : List SequenceAlignment
  phyloP : ℝ
  phastCons : ℝ
  conserved : Prop

structure NoncodingRnaConservationEvidence (C : NoncodingRnaConservationPackage) where
  alignmentsNonempty : C.alignments ≠ []
  phyloPSignificant : C.phyloP > 0
  phastConsSignificant : C.phastCons > 0.5
  conservedClosed : C.conserved

def NoncodingRnaConservationClosed (C : NoncodingRnaConservationPackage) : Prop :=
  C.alignments ≠ [] ∧ C.phyloP > 0 ∧ C.phastCons > 0.5 ∧ C.conserved

theorem noncoding_rna_conservation_closed_from_evidence
    (C : NoncodingRnaConservationPackage) (E : NoncodingRnaConservationEvidence C) :
    NoncodingRnaConservationClosed C := by
  exact And.intro E.alignmentsNonempty (And.intro E.phyloPSignificant (And.intro E.phastConsSignificant E.conservedClosed))

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse