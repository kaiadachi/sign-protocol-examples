// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

// solhint-disable state-visibility
pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r =
        21_888_242_871_839_275_222_246_405_745_257_275_088_548_364_400_416_034_343_698_204_186_575_808_495_617;
    // Base field size
    uint256 constant q =
        21_888_242_871_839_275_222_246_405_745_257_275_088_696_311_157_297_823_662_689_037_894_645_226_208_583;

    // Verification Key data
    uint256 constant alphax =
        15_314_780_626_166_854_639_429_429_712_985_873_450_044_551_734_031_636_292_615_741_160_316_386_035_692;
    uint256 constant alphay =
        8_832_387_358_570_447_427_099_243_816_300_023_917_323_789_443_326_873_047_946_896_067_051_151_833_149;
    uint256 constant betax1 =
        4_623_233_545_423_082_718_706_146_213_340_326_938_161_408_617_405_182_333_720_426_255_762_190_910_195;
    uint256 constant betax2 =
        7_374_564_731_595_535_334_131_017_780_458_122_114_321_192_915_671_109_164_722_313_443_871_371_593_233;
    uint256 constant betay1 =
        13_389_502_380_269_697_174_068_950_385_615_867_020_318_507_241_480_124_462_830_271_058_046_968_934_268;
    uint256 constant betay2 =
        4_540_272_798_860_434_869_583_511_966_411_229_089_859_429_270_341_958_304_561_580_577_107_176_618_242;
    uint256 constant gammax1 =
        11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634;
    uint256 constant gammax2 =
        10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781;
    uint256 constant gammay1 =
        4_082_367_875_863_433_681_332_203_403_145_435_568_316_851_327_593_401_208_105_741_076_214_120_093_531;
    uint256 constant gammay2 =
        8_495_653_923_123_431_417_604_973_247_489_272_438_418_190_587_263_600_148_770_280_649_306_958_101_930;
    uint256 constant deltax1 =
        6_716_645_631_409_171_411_777_306_098_294_484_826_425_032_869_995_406_867_946_928_254_091_585_694_653;
    uint256 constant deltax2 =
        8_175_369_706_924_043_838_750_437_883_957_790_432_456_398_659_888_736_415_469_791_850_586_978_395_279;
    uint256 constant deltay1 =
        18_540_369_723_014_864_913_600_347_973_455_003_769_708_105_432_812_250_054_601_533_239_305_057_685_337;
    uint256 constant deltay2 =
        10_265_130_205_950_910_063_305_067_578_091_736_069_441_736_746_098_973_805_156_471_039_271_932_237_981;

    uint256 constant IC0x =
        15_138_654_093_056_528_020_381_256_154_365_905_326_681_217_845_426_665_637_033_620_085_153_541_253_881;
    uint256 constant IC0y =
        15_082_115_688_141_132_785_777_555_656_292_586_944_047_372_331_923_614_856_546_620_476_515_308_779_423;

    uint256 constant IC1x =
        20_194_155_377_879_678_689_570_160_317_546_416_789_895_304_920_010_458_251_540_486_820_779_228_506_248;
    uint256 constant IC1y =
        3_283_399_730_066_420_084_214_475_495_210_026_899_467_184_078_499_841_420_284_227_518_068_057_771_915;

    uint256 constant IC2x =
        19_752_076_915_497_149_429_420_693_362_482_903_534_316_153_690_163_194_614_481_211_094_041_374_634_825;
    uint256 constant IC2y =
        5_758_446_236_992_054_122_022_796_236_064_864_385_095_074_864_907_429_650_479_499_137_005_711_876_806;

    uint256 constant IC3x =
        8_135_850_476_066_808_412_204_214_819_406_302_052_293_986_166_496_882_658_444_611_304_001_617_038_071;
    uint256 constant IC3y =
        7_784_595_936_346_894_192_333_288_575_823_776_130_704_327_685_144_391_408_755_558_289_935_593_869_102;

    uint256 constant IC4x =
        5_072_431_704_630_388_940_640_665_915_815_949_661_306_830_292_296_519_763_082_584_917_285_155_379_597;
    uint256 constant IC4y =
        13_137_877_045_207_008_881_904_385_664_769_512_335_361_538_789_599_406_351_834_829_738_490_013_090_579;

    uint256 constant IC5x =
        7_139_087_629_490_142_780_748_322_240_193_280_468_932_204_231_862_815_244_542_001_615_859_867_299_358;
    uint256 constant IC5y =
        1_202_634_139_100_259_237_791_623_481_392_638_049_699_032_789_438_033_260_485_537_441_871_791_217_401;

    uint256 constant IC6x =
        8_441_099_393_780_659_556_495_284_913_281_694_168_402_799_476_224_321_453_610_626_044_061_410_476_651;
    uint256 constant IC6y =
        2_345_548_987_466_434_896_958_321_048_845_973_984_013_326_980_973_570_301_926_554_043_309_834_107_263;

    uint256 constant IC7x =
        18_014_858_965_839_638_840_314_922_315_691_346_264_874_507_127_174_128_894_298_070_377_580_382_324_635;
    uint256 constant IC7y =
        2_056_699_874_289_487_987_527_913_182_887_800_074_024_183_844_269_785_748_972_276_354_832_984_462_642;

    uint256 constant IC8x =
        16_528_153_697_682_001_276_877_579_257_299_566_815_006_098_186_759_135_755_318_985_598_935_788_127_888;
    uint256 constant IC8y =
        7_801_153_293_098_102_614_719_966_144_050_064_475_643_676_695_333_051_254_719_486_648_740_227_500_998;

    uint256 constant IC9x =
        17_436_640_569_030_801_164_001_260_106_208_179_207_555_983_194_394_679_542_102_589_094_667_536_664_797;
    uint256 constant IC9y =
        18_311_789_646_886_379_161_114_527_018_718_352_931_090_031_778_117_474_293_482_272_533_484_569_308_377;

    uint256 constant IC10x =
        4_553_119_537_151_222_419_635_033_750_491_556_214_631_081_242_805_738_572_515_087_290_266_147_146_338;
    uint256 constant IC10y =
        19_313_500_167_959_927_398_806_481_190_805_418_815_554_700_579_437_407_561_538_880_568_925_685_430_905;

    uint256 constant IC11x =
        2_159_124_060_725_945_833_118_923_048_056_080_985_717_844_815_975_315_131_175_310_104_373_613_633_400;
    uint256 constant IC11y =
        10_207_890_157_617_189_107_736_057_098_035_157_033_359_306_333_111_068_491_471_814_173_525_367_426_196;

    uint256 constant IC12x =
        21_677_206_633_998_931_519_150_526_562_904_090_462_127_945_040_619_681_934_979_237_517_496_283_670_625;
    uint256 constant IC12y =
        21_679_530_963_862_454_084_227_662_626_565_878_888_043_586_027_235_389_133_196_512_861_490_117_707_437;

    uint256 constant IC13x =
        14_227_380_932_321_788_780_432_724_671_780_525_156_668_542_509_578_350_121_512_280_353_856_194_070_137;
    uint256 constant IC13y =
        21_289_421_403_632_851_531_815_049_854_573_883_961_814_524_811_827_417_343_242_627_237_215_588_827_109;

    uint256 constant IC14x =
        5_721_058_245_522_092_083_396_916_911_499_110_560_595_835_286_825_709_228_641_325_988_792_537_416_501;
    uint256 constant IC14y =
        11_758_903_057_814_556_710_020_109_990_419_551_561_772_956_337_888_338_270_144_380_178_329_880_111_487;

    uint256 constant IC15x =
        9_918_471_454_169_812_661_882_427_494_104_559_829_109_926_586_398_653_496_138_695_974_550_256_981_429;
    uint256 constant IC15y =
        4_297_771_942_769_343_748_773_375_792_130_615_090_062_145_648_267_483_731_482_667_240_963_462_023_911;

    uint256 constant IC16x =
        18_966_209_571_567_319_914_044_613_931_240_614_035_136_688_639_982_681_182_669_635_514_775_414_402_123;
    uint256 constant IC16y =
        6_265_992_446_603_837_102_491_935_172_640_553_434_956_882_152_363_809_213_128_419_615_543_142_666_738;

    uint256 constant IC17x =
        6_862_718_726_385_110_266_047_806_220_497_641_160_647_768_733_793_304_833_341_521_100_296_848_837_572;
    uint256 constant IC17y =
        52_277_514_265_158_036_559_920_797_000_365_117_089_456_929_353_475_854_397_879_904_927_166_803_341;

    uint256 constant IC18x =
        12_689_987_388_664_273_985_977_309_835_571_216_802_645_890_351_381_787_535_355_870_070_212_003_855_569;
    uint256 constant IC18y =
        3_272_753_039_944_028_918_552_659_025_599_994_105_246_178_554_537_481_096_156_705_418_675_106_878_141;

    uint256 constant IC19x =
        21_294_822_601_523_941_771_195_751_726_852_577_929_152_083_818_567_724_215_561_223_651_408_612_061_162;
    uint256 constant IC19y =
        1_925_507_122_770_646_144_482_296_175_289_620_937_682_032_624_166_325_978_910_381_928_919_940_067_649;

    uint256 constant IC20x =
        9_590_150_530_590_460_953_412_694_649_043_816_284_682_987_496_963_746_540_623_143_414_030_773_409_230;
    uint256 constant IC20y =
        2_431_509_792_644_958_153_894_201_721_275_532_476_386_412_637_657_725_030_494_529_871_094_395_797_854;

    uint256 constant IC21x =
        11_754_167_351_234_078_922_070_585_270_836_193_594_558_017_722_127_114_400_921_977_263_568_977_416_683;
    uint256 constant IC21y =
        16_901_520_189_361_975_800_319_814_328_883_354_158_816_554_086_767_825_900_115_592_985_646_661_816_096;

    uint256 constant IC22x =
        531_143_243_593_819_214_007_797_008_408_099_534_146_556_114_476_449_999_533_440_674_306_816_791_515;
    uint256 constant IC22y =
        21_260_224_434_260_669_714_633_970_615_728_663_731_727_658_289_770_365_391_965_416_469_793_335_026_807;

    uint256 constant IC23x =
        18_312_196_391_883_661_249_992_186_699_258_031_640_404_987_219_346_330_098_804_119_384_439_590_406_783;
    uint256 constant IC23y =
        157_588_706_260_529_690_380_068_646_539_103_168_353_723_836_085_230_951_018_929_085_709_206_933_753;

    uint256 constant IC24x =
        11_144_541_678_010_024_502_099_792_163_887_300_512_748_656_940_851_120_103_691_820_303_141_306_339_689;
    uint256 constant IC24y =
        14_942_571_319_880_125_619_437_542_201_643_578_046_745_834_478_331_143_017_120_376_075_998_883_840_515;

    uint256 constant IC25x =
        14_296_660_164_089_856_645_945_644_037_788_619_484_602_725_058_575_420_822_907_498_997_065_047_198_144;
    uint256 constant IC25y =
        21_856_427_993_447_994_395_083_255_742_826_872_808_461_797_181_831_654_878_027_844_697_604_907_415_248;

    uint256 constant IC26x =
        9_616_158_215_160_518_527_252_566_874_466_243_845_154_579_496_195_825_313_614_336_535_610_704_469_475;
    uint256 constant IC26y =
        973_899_933_839_328_889_367_428_779_215_840_143_196_510_959_744_820_744_572_264_795_493_363_558_076;

    uint256 constant IC27x =
        17_376_406_969_046_575_658_730_322_670_115_302_374_205_780_354_312_819_119_831_231_461_778_710_068_545;
    uint256 constant IC27y =
        17_138_951_000_611_274_084_181_532_953_527_108_821_661_746_672_962_834_452_274_787_799_396_615_726_039;

    uint256 constant IC28x =
        5_183_575_158_062_219_307_417_911_372_959_422_746_950_905_749_520_930_051_559_285_887_994_763_523_760;
    uint256 constant IC28y =
        2_782_960_004_171_030_125_536_837_484_217_633_342_210_275_956_683_383_429_345_416_673_964_374_747_373;

    uint256 constant IC29x =
        1_312_922_482_928_811_581_848_763_915_905_006_677_272_634_608_894_760_072_646_978_872_971_685_169_385;
    uint256 constant IC29y =
        6_672_137_377_833_469_312_950_507_411_988_491_572_105_176_465_208_108_664_104_446_654_057_197_601_304;

    uint256 constant IC30x =
        1_634_477_118_980_158_454_602_706_860_066_294_717_962_584_244_705_115_168_259_531_039_364_543_440_656;
    uint256 constant IC30y =
        21_239_802_130_143_727_704_605_520_124_160_180_822_981_232_141_407_244_915_237_170_021_445_649_573_334;

    uint256 constant IC31x =
        16_281_167_990_662_010_646_248_209_204_609_677_025_715_940_868_033_424_720_309_066_125_033_930_768_662;
    uint256 constant IC31y =
        19_249_655_555_063_328_987_113_440_761_282_952_282_701_372_834_028_462_672_314_680_353_707_554_126_071;

    uint256 constant IC32x =
        10_807_992_204_123_951_429_466_656_548_099_582_258_280_269_751_452_852_003_902_070_168_634_617_723_912;
    uint256 constant IC32y =
        19_664_348_584_451_223_615_512_369_938_810_331_910_633_767_112_351_103_167_149_617_105_464_354_525_411;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] memory _pA,
        uint256[2][2] memory _pB,
        uint256[2] memory _pC,
        uint256[32] memory _pubSignals
    )
        public
        view
        returns (bool)
    {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))

                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))

                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))

                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))

                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))

                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))

                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))

                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))

                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))

                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))

                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))

                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))

                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))

                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))

                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))

                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))

                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))

                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))

                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))

                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))

                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))

                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)

                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            checkField(calldataload(add(_pubSignals, 384)))

            checkField(calldataload(add(_pubSignals, 416)))

            checkField(calldataload(add(_pubSignals, 448)))

            checkField(calldataload(add(_pubSignals, 480)))

            checkField(calldataload(add(_pubSignals, 512)))

            checkField(calldataload(add(_pubSignals, 544)))

            checkField(calldataload(add(_pubSignals, 576)))

            checkField(calldataload(add(_pubSignals, 608)))

            checkField(calldataload(add(_pubSignals, 640)))

            checkField(calldataload(add(_pubSignals, 672)))

            checkField(calldataload(add(_pubSignals, 704)))

            checkField(calldataload(add(_pubSignals, 736)))

            checkField(calldataload(add(_pubSignals, 768)))

            checkField(calldataload(add(_pubSignals, 800)))

            checkField(calldataload(add(_pubSignals, 832)))

            checkField(calldataload(add(_pubSignals, 864)))

            checkField(calldataload(add(_pubSignals, 896)))

            checkField(calldataload(add(_pubSignals, 928)))

            checkField(calldataload(add(_pubSignals, 960)))

            checkField(calldataload(add(_pubSignals, 992)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}
