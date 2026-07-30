import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure CircularRnaBiogenesis where
  backsplicingReaction : Prop
  exonCircularizationSignal : Prop
  rnaBindingProteins : List String
  stabilityEnhancement : Prop
  micrornaSpongeActivity : Prop

structure CircularRnaBiogenesisEvidence (C : CircularRnaBiogenesis) where
  backsplicingReactionClosed : C.backsplicingReaction
  exonCircularizationSignalClosed : C.exonCircularizationSignal
  rnaBindingProteinsClosed : C.rnaBindingProteins.length ≥ 1
  stabilityEnhancementClosed : C.stabilityEnhancement
  micrornaSpongeActivityClosed : C.micrornaSpongeActivity

def CircularRnaBiogenesisClosed (C : CircularRnaBiogenesis) : Prop :=
  C.backsplicingReaction ∧ C.exonCircularizationSignal ∧ C.rnaBindingProteins.length ≥ 1 ∧
  C.stabilityEnhancement ∧ C.micrornaSpongeActivity

theorem circular_rna_biogenesis_closed_from_evidence
    (C : CircularRnaBiogenesis) (E : CircularRnaBiogenesisEvidence C) :
    CircularRnaBiogenesisClosed C := by
  exact And.intro E.backsplicingReactionClosed
    (And.intro E.exonCircularizationSignalClosed
      (And.intro E.rnaBindingProteinsClosed
        (And.intro E.stabilityEnhancementClosed E.micrornaSpongeActivityClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse