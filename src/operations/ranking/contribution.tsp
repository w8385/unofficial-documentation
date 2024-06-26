using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace SolvedAC;

/**
 * 기여 횟수가 높은 사용자가 먼저 오도록 정렬한 사용자 목록을 가져옵니다.
 *
 * @return
 *     페이지네이션 가능한 사용자 목록을 반환합니다.
 */
@summary("기여 순 사용자 랭킹 가져오기")
@tag("ranking")
@useAuth(TokenAuth)
@get
@route("/ranking/contribution")
op getRankingByContribution(
  /**
   * 응답을 받을 언어입니다.
   */
  @header
  `x-solvedac-language`?: Language,

  /**
   * 페이지
   */
  @query
  page?: uint32,
): GetRankingByContribution.Ok;

namespace GetRankingByContribution {
  @extension(XInternal, true)
  model Ok {
    @statusCode status: 200;
    @body data: PaginatedList<RivalUser>;
  }
}
