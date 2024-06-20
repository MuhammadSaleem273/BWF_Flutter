void main() {

  Map<String, String> countryCodes = {
    'Pakistan': '+92',
    'UK': '+44',
    'India': '+91',
    'Japan': '+81'
  };

  
  print('Country code for Pakistan: ${countryCodes['Pakistan']}');
  print('Country code for India: ${countryCodes['India']}');

  
  countryCodes['Australia'] = '+61';

  
  countryCodes.remove('UK');

  print('All country codes:');
  countryCodes.forEach((key, value) {
    print('$key: $value');
  });

  if (countryCodes.containsKey('Japan')) {
    print('Japan is in the map.');
  } else {
    print('Japan is not in the map.');
  }
}
 
