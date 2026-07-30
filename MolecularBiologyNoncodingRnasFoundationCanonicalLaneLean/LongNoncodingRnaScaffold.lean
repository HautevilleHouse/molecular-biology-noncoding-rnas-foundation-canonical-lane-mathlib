import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure LongNoncodingRnaScaffold where
  rnaSequence : String
  secondaryStructure : Prop
  proteinBindingDomains : List String
  chromatinInteraction : Prop
  nuclearLocalization : Prop

structure LongNoncodingRnaScaffoldEvidence (L : LongNoncodingRnaScaffold) where
  secondaryStructureClosed : L.secondaryStructure
  proteinBindingDomainsClosed : L.proteinBindingDomains.length ≥ 1
  chromatinInteractionClosed : L.chromatinInteraction
  nuclearLocalizationClosed : L.nuclearLocalization

def LongNoncodingRnaScaffoldClosed (L : LongNoncodingRnaScaffold) : Prop :=
  L.secondaryStructure ∧ L.proteinBindingDomains.length ≥ 1 ∧ L.chromatinInteraction ∧ L.nuclearLocalization

theorem long_noncoding_rna_scaffold_closed_from_evidence
    (L : LongNoncodingRnaScaffold) (E : LongNoncodingRnaScaffoldEvidence L) :
    LongNoncodingRnaScaffoldClosed L := by
  exact And.intro E.secondaryStructureClosed
    (And.intro E.proteinBindingDomainsClosed
      (And.intro E.chromatinInteractionClosed E.nuclearLocalizationClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse