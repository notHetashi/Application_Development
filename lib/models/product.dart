class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final Map<String, String> specifications;
  final double rating;
  final int reviewCount;
  final bool inStock;
  final String seller;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.specifications,
    required this.rating,
    required this.reviewCount,
    required this.inStock,
    required this.seller,
  });
}

class Category {
  final String id;
  final String title;
  final String imageUrl;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

//Category for each pc components available
final List<Category> Buildhive_Categories = [
  Category(
    id: 'c1',
    title: 'CPUs',
    imageUrl: 'assets/images/cpu.png',
  ),
  Category(
    id: 'c2',
    title: 'GPUs',
    imageUrl: 'assets/images/gpu.png',
  ),
  Category(
    id: 'c3',
    title: 'Motherboards',
    imageUrl: 'assets/images/motherboard.png',
  ),
  Category(
    id: 'c4',
    title: 'RAM',
    imageUrl: 'assets/images/ram.png',
  ),
  Category(
    id: 'c5',
    title: 'Storage',
    imageUrl: 'assets/images/ssd.png',
  ),
  Category(
    id: 'c6',
    title: 'Power Supplies',
    imageUrl: 'assets/images/powersupply.png',
  ),
];

//Listing for each products within the marketplace w/ sellers
final List<Product> Buildhive_Products = [
  Product(
    id: 'p1',
    title: 'AMD Ryzen 9 5900X',
    description: 'High-performance CPU with 12 cores and 24 threads for gaming and content creation.',
    price: 18550.00,
    imageUrl: 'assets/images/amd9.jpg',
    category: 'c1',
    specifications: {
      'Cores': '12',
      'Threads': '24',
      'Base Clock': '3.7 GHz',
      'Boost Clock': '4.8 GHz',
      'TDP': '105W',
      'Socket': 'AM4',
    },
    rating: 4.8,
    reviewCount: 1245,
    inStock: true,
    seller: 'AMD',
  ),
  Product(
    id: 'p2',
    title: 'NVIDIA GeForce RTX 4080',
    description: 'Powerful graphics card for gaming and rendering with ray tracing capabilities.',
    price: 68395.00,
    imageUrl: 'assets/images/g4080.jpg',
    category: 'c2',
    specifications: {
      'CUDA Cores': '9728',
      'Memory': '16GB GDDR6X',
      'Memory Interface': '256-bit',
      'Boost Clock': '2.5 GHz',
      'Power Connectors': '1x 16-pin',
    },
    rating: 2.5,
    reviewCount: 3,
    inStock: true,
    seller: 'Joshua Pornias'
  ),
  Product(
    id: 'p3',
    title: 'ASUS ROG Strix X570-E Gaming',
    description: 'High-end motherboard for AMD processors with PCIe 4.0 support and robust VRM.',
    price: 17360.00,
    imageUrl: 'assets/images/ASUS-ROG.jpg',
    category: 'c3',
    specifications: {
      'Socket': 'AM4',
      'Chipset': 'X570',
      'Memory Support': 'DDR4 4400MHz (OC)',
      'PCIe Slots': '2x PCIe 4.0 x16, 1x PCIe 4.0 x4',
      'M.2 Slots': '2x PCIe 4.0 x4',
    },
    rating: 3,
    reviewCount: 1,
    inStock: true,
    seller: 'Daryll Cris Celestial'
  ),
  Product(
    id: 'p4',
    title: 'Corsair Vengeance RGB Pro 32GB',
    description: 'High-performance DDR4 memory with RGB lighting for gaming and productivity.',
    price: 11299.00,
    imageUrl: 'assets/images/corsair.jpg',
    category: 'c4',
    specifications: {
      'Capacity': '32GB (2x16GB)',
      'Type': 'DDR4',
      'Speed': '3600MHz',
      'CAS Latency': '18',
      'Voltage': '1.35V',
    },
    rating: 4.8,
    reviewCount: 999,
    inStock: true,
    seller: 'Corsair',
  ),
  Product(
    id: 'p5',
    title: 'Samsung 980 PRO 1TB',
    description: 'Ultra-fast NVMe SSD with PCIe 4.0 interface for gaming and professional workloads.',
    price: 6995.00,
    imageUrl: 'assets/images/samsung.jpg',
    category: 'c5',
    specifications: {
      'Capacity': '1TB',
      'Interface': 'PCIe 4.0 x4',
      'Sequential Read': 'Up to 7,000 MB/s',
      'Sequential Write': 'Up to 5,000 MB/s',
      'Form Factor': 'M.2 2280',
    },
    rating: 4.9,
    reviewCount: 999,
    inStock: true,
    seller: 'Samsung',
  ),
  Product(
    id: 'p6',
    title: 'Corsair RM850x',
    description: 'Fully modular power supply with 80 PLUS Gold certification for efficient power delivery.',
    price: 7650.00,
    imageUrl: 'assets/images/corsair_psu.jpg',
    category: 'c6',
    specifications: {
      'Wattage': '850W',
      'Efficiency': '80 PLUS Gold',
      'Modularity': 'Fully Modular',
      'Fan Size': '135mm',
      'Warranty': '10 Years',
    },
    rating: 0,
    reviewCount: 0,
    inStock: true,
    seller: 'Wayne Yzon B. Nagares',
  ),
  Product(
    id: 'p7',
    title: 'Intel Core i9-13900K',
    description: 'Latest generation Intel CPU with 24 cores for extreme performance.',
    price: 27995.00,
    imageUrl: 'assets/images/intel.jpg',
    category: 'c1',
    specifications: {
      'Cores': '24 (8P+16E)',
      'Threads': '32',
      'Base Clock': '3.0 GHz (P-cores)',
      'Boost Clock': '5.8 GHz (P-cores)',
      'TDP': '125W',
      'Socket': 'LGA 1700',
    },
    rating: 0,
    reviewCount: 0,
    inStock: true,
    seller: 'Christian Bolea'
  ),
  Product(
    id: 'p8',
    title: 'AMD Radeon RX 7900 XTX',
    description: 'High-end AMD graphics card with RDNA 3 architecture for gaming and content creation.',
    price: 64950.00,
    imageUrl: 'assets/images/amd.jpg',
    category: 'c2',
    specifications: {
      'Compute Units': '96',
      'Memory': '24GB GDDR6',
      'Memory Interface': '384-bit',
      'Game Clock': '2.3 GHz',
      'Power Connectors': '2x 8-pin',
    },
    rating: 4.7,
    reviewCount: 999,
    inStock: false,
    seller: 'AMD'
  ),
];
