import 'package:ex_bank/models/bank_product.dart';

class DummyData {
  static List<BankProduct> products = [
    // 예금 상품
    BankProduct(
      id: '1',
      name: '더(The) 레벨업 정기예금',
      category: '예금',
      description: '매월 금리가 단계적으로 상승하는 정기예금',
      interestRate: '연 3.5% ~ 4.2%',
      minimumAmount: '100만원',
      period: '12개월',
      features: '월별 금리 상승, 중도해지 가능',
      benefits: '금리 우대 혜택, 자동연장 가능',
      riskLevel: '낮음',
      targetCustomer: '안정적인 수익을 원하는 고객',
    ),
    BankProduct(
      id: '2',
      name: '저탄소 실천 예금',
      category: '예금',
      description: '환경보호 실천 고객을 위한 특별 예금',
      interestRate: '연 3.8%',
      minimumAmount: '50만원',
      period: '6개월 ~ 24개월',
      features: 'ESG 실천 인증, 탄소 발자국 감소',
      benefits: '환경 기여도 리포트 제공',
      riskLevel: '낮음',
      targetCustomer: '환경보호에 관심 있는 고객',
    ),
    BankProduct(
      id: '3',
      name: '청년 희망 정기예금',
      category: '예금',
      description: '청년층을 위한 우대금리 정기예금',
      interestRate: '연 4.0%',
      minimumAmount: '10만원',
      period: '12개월',
      features: '청년 전용, 우대금리',
      benefits: '만 34세 이하 우대, 취업 축하금',
      riskLevel: '낮음',
      targetCustomer: '만 19세 ~ 34세 청년',
    ),

    // 적금 상품
    BankProduct(
      id: '4',
      name: '꿈나무 적금',
      category: '적금',
      description: '매월 일정 금액을 적립하는 정기적금',
      interestRate: '연 3.2%',
      minimumAmount: '월 5만원',
      period: '12개월 ~ 36개월',
      features: '자동이체, 금액 변경 가능',
      benefits: '목돈 마련, 절약 습관 형성',
      riskLevel: '낮음',
      targetCustomer: '목돈 마련이 필요한 고객',
    ),
    BankProduct(
      id: '5',
      name: '자유 적금',
      category: '적금',
      description: '자유롭게 입금할 수 있는 자유적금',
      interestRate: '연 2.8%',
      minimumAmount: '월 1만원',
      period: '12개월',
      features: '자유입금, 추가입금 가능',
      benefits: '유연한 납입, 언제든지 추가 입금',
      riskLevel: '낮음',
      targetCustomer: '불규칙한 수입이 있는 고객',
    ),

    // 펀드 상품
    BankProduct(
      id: '6',
      name: '글로벌 성장 펀드',
      category: '펀드',
      description: '해외 성장주에 투자하는 펀드',
      interestRate: '기대수익률 연 8%',
      minimumAmount: '10만원',
      period: '3년 이상 권장',
      features: '해외투자, 분산투자',
      benefits: '글로벌 포트폴리오, 전문가 운용',
      riskLevel: '높음',
      targetCustomer: '적극적 투자를 원하는 고객',
    ),
    BankProduct(
      id: '7',
      name: '안정형 혼합 펀드',
      category: '펀드',
      description: '채권과 주식을 혼합한 안정형 펀드',
      interestRate: '기대수익률 연 5%',
      minimumAmount: '5만원',
      period: '1년 이상 권장',
      features: '안정성과 수익성 균형',
      benefits: '리스크 분산, 전문가 운용',
      riskLevel: '중간',
      targetCustomer: '안정적인 투자를 원하는 고객',
    ),

    // 대출 상품
    BankProduct(
      id: '8',
      name: '주택담보대출',
      category: '대출',
      description: '주택을 담보로 하는 장기 대출',
      interestRate: '연 4.5% ~ 6.5%',
      minimumAmount: '1억원',
      period: '최대 30년',
      features: '주택담보, 장기상환',
      benefits: '낮은 금리, 세제 혜택',
      riskLevel: '중간',
      targetCustomer: '주택 구입 또는 자금 필요 고객',
    ),
    BankProduct(
      id: '9',
      name: '신용대출',
      category: '대출',
      description: '담보 없이 신용으로 대출',
      interestRate: '연 6.0% ~ 15.0%',
      minimumAmount: '100만원',
      period: '최대 7년',
      features: '무담보, 신속한 심사',
      benefits: '간편한 절차, 빠른 승인',
      riskLevel: '중간',
      targetCustomer: '급전이 필요한 고객',
    ),

    // 신탁 상품
    BankProduct(
      id: '10',
      name: '자산관리 신탁',
      category: '신탁',
      description: '전문가가 자산을 관리하는 신탁상품',
      interestRate: '시장수익률 연동',
      minimumAmount: '1,000만원',
      period: '1년 이상',
      features: '전문가 운용, 맞춤형 관리',
      benefits: '체계적 자산관리, 세제 혜택',
      riskLevel: '중간',
      targetCustomer: '고액 자산 보유 고객',
    ),

    // 보험/공제 상품
    BankProduct(
      id: '11',
      name: '종합보험',
      category: '보험/공제',
      description: '생명보험과 손해보험을 결합한 종합보험',
      interestRate: '보장성 상품',
      minimumAmount: '월 10만원',
      period: '20년 ~ 종신',
      features: '종합보장, 만기환급',
      benefits: '질병/상해 보장, 노후 준비',
      riskLevel: '낮음',
      targetCustomer: '종합적인 보장이 필요한 고객',
    ),

    // 퇴직연금 상품
    BankProduct(
      id: '12',
      name: '퇴직연금 DC',
      category: '퇴직연금',
      description: '확정기여형 퇴직연금',
      interestRate: '연 4.0% ~ 7.0%',
      minimumAmount: '월 납입액',
      period: '퇴직 시까지',
      features: '세제 혜택, 포트폴리오 선택',
      benefits: '노후 준비, 세액 공제',
      riskLevel: '중간',
      targetCustomer: '직장인, 노후 준비가 필요한 고객',
    ),
  ];

  static List<String> categories = [
    '전체',
    '예금',
    '적금',
    '펀드',
    '대출',
    '신탁',
    '보험/공제',
    '퇴직연금',
  ];

  static List<BankProduct> getProductsByCategory(String category) {
    if (category == '전체') {
      return products;
    }
    return products.where((product) => product.category == category).toList();
  }
}
