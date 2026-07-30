import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure GenomicLocusPackage where
  chromosome : String
  strand : String  -- "+" or "-"
  start : Nat
  end : Nat
  locusStrandValid : Prop
  locusCoordinatesValid : Prop

structure GenomicLocusEvidence (G : GenomicLocusPackage) where
  locusStrandValidClosed : G.locusStrandValid
  locusCoordinatesValidClosed : G.locusCoordinatesValid

def GenomicLocusClosed (G : GenomicLocusPackage) : Prop :=
  G.locusStrandValid ∧ G.locusCoordinatesValid

theorem genomic_locus_closed_from_evidence (G : GenomicLocusPackage) (E : GenomicLocusEvidence G) :
    GenomicLocusClosed G := by
  exact And.intro E.locusStrandValidClosed E.locusCoordinatesValidClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse