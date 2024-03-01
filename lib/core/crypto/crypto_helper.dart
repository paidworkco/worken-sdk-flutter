import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:crypto/crypto.dart';
import 'package:hex/hex.dart';

///FIXME - check all functions
class CryptoHelper {
  static String generateSeedPhrase(int words) {
    if (![12, 15, 18, 21, 24].contains(words)) {
      throw ArgumentError(
          "Invalid number of words for a mnemonic. Allowed values are 12, 15, 18, 21, 24.");
    }

    return bip39.generateMnemonic(strength: words * 11);
  }

  static Map<String, dynamic> generateKeysfromSeedPhrase(String mnemonic) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final node = bip32.BIP32.fromSeed(seed);
    final priv = node.derivePath("m/44'/60'/0'/0/0");

    return {
      'words': mnemonic.split(' '),
      'privateKey': priv.toBase58(),
      'publicKey': priv.publicKey.toString()
    };

    /*    ED25519_HD_KEY.getPublicKey(priv)
    var seedBuffer = Uint8List.fromList(HEX.decode(entropy));
    var master = HDWallet.fromSeed(seed: seedBuffer);
    var child = master.deriveKeyByPath(path: "m/44'/60'/0'/0/0");

    return {
      'privateKey': HEX.encode(child.privKey.toString().codeUnits),
      'publicKey': child.pubKey.toString(),
      'publicKeyCompressed': child.pubKey.
    }; */
  }

  static String generateAddressfromPublicKey(String publicKey) {
    publicKey = publicKey.replaceAll('0x', '');
    var hash = sha256.convert(HEX.decode(publicKey.substring(2)));
    var address = '0x${hash.toString().substring(64 - 40)}';
    return address;
  }
}
